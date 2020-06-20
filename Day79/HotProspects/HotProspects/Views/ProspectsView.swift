//
//  ProspectsView.swift
//  HotProspects
//
//  Created by Victor Rolando Sanchez Jara on 6/17/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI
import CodeScanner
import UserNotifications

struct ProspectsView: View {
    // MARK: Properties
    enum FilterType {
        case none, contacted, uncontacted
    }
    
    @EnvironmentObject var prospects: Prospects

    let filter: FilterType
    
    var title: String {
        switch filter {
            case .none:
                return "Everyone"
            case .contacted:
                return "Contacted people"
            case .uncontacted:
                return "Uncontacted people"
        }
    }
    
    var filteredProspects: [Prospect] {
        switch filter {
            case .none:
                return prospects.people
            case .contacted:
                return prospects.people.filter { $0.isContacted }
            case .uncontacted:
                return prospects.people.filter { !$0.isContacted }
        }
    }
    
    @State private var isShowingScanner = false

    @State private var showingActionSheet = false
    
    let randomData = ["Paul Hudson\npaul@hackingwithswift.com", "Zaul Zloberman\ngreatzaul@apple.com"]
    // MARK: Body
    var body: some View {
        NavigationView {
            List {
                ForEach(filteredProspects) { prospect in
                    HStack {
                        if self.filter == .none {
                            Image(systemName: prospect.isContacted ? "checkmark.circle" : "questionmark.diamond")
                            // checkmark.circle
                            //
                        }
                        VStack(alignment: .leading) {
                            Text(prospect.name)
                                .font(.headline)
                            Text(prospect.emailAddress)
                                .foregroundColor(.secondary)
                        }
                    }
                    .contextMenu {
                        Button(prospect.isContacted ? "Mark Uncontacted" : "Mark Contacted" ) {
                            self.prospects.toggle(prospect)
                        }
                        if !prospect.isContacted {
                            Button("Remind Me") {
                                self.addNotification(for: prospect)
                            }
                        }
                    }
                }
            }
                .navigationBarTitle(title)
            .navigationBarItems(leading: Button(action: {
                                    self.showingActionSheet.toggle()
                                }, label: {
                                    Image(systemName: "arrow.up.arrow.down.circle")
                                    Text("Sort")
                                }),
                                trailing: Button(action: {
                    self.isShowingScanner = true

//                    let prospect = Prospect()
//                    prospect.name = "Paul Hudson"
//                    prospect.emailAddress = "paul@hackingwithswift.com"
//                    self.prospects.people.append(prospect)
                }) {
                    Image(systemName: "qrcode.viewfinder")
                    Text("Scan")
                })
                .sheet(isPresented: $isShowingScanner) {
                    CodeScannerView(codeTypes: [.qr], simulatedData: self.randomData.randomElement()!, completion: self.handleScan)
                }
            .actionSheet(isPresented: $showingActionSheet) {
                ActionSheet(title: Text("Sort by"), message: nil, buttons: [
                    .default(Text("Name")) { self.prospects.sortBy(criteria: .name) },
                    .default(Text("Email")) { self.prospects.sortBy(criteria: .email) },
                    .cancel()
                ])
            }
        }
    }
    
    // MARK: Methods
    func handleScan(result: Result<String, CodeScannerView.ScanError>) {
        self.isShowingScanner = false
        
        switch result {
            case .success(let code):
                let details = code.components(separatedBy: "\n")
                guard details.count == 2 else { return }
                
                let person = Prospect()
                person.name = details[0]
                person.emailAddress = details[1]
                
//                self.prospects.people.append(person)
//                self.prospects.save()
                // Better encapsulation
                self.prospects.add(person)

            case .failure(let error):
                print("Scanning failed \(error.localizedDescription)")
        }
    }
    
    func addNotification(for prospect: Prospect) {
        let center = UNUserNotificationCenter.current()
        
        let addRequest = {
            let content = UNMutableNotificationContent()
            content.title = "Contact \(prospect.name)"
            content.subtitle = prospect.emailAddress
            content.sound = UNNotificationSound.default
            
            var dateComponents = DateComponents()
            dateComponents.hour = 9
//            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)

            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            center.add(request)
        }
        
        center.getNotificationSettings { settings in
            if settings.authorizationStatus == .authorized {
                addRequest()
            } else {
                center.requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        addRequest()
                    } else {
                        print("D'oh")
                    }
                }
            }
        }

    }
    
}

struct ProspectsView_Previews: PreviewProvider {
    static var previews: some View {
        ProspectsView(filter: .none)
        .environmentObject(Prospects())
    }
}
