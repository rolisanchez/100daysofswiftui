//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Victor Rolando Sanchez Jara on 7/1/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI

// For a real challenge, let the user sort and filter the resorts in ContentView.
// For sorting use default, alphabetical, and country, and
enum SortType: CaseIterable {
    case defaultSort, alphabetical, country
}
// For filtering let them select country, size, or price.

enum FilterType: CaseIterable {
    case none, austria, france, italy, us, canada, size, price
}

struct ContentView: View {
    // MARK: Properties
    let originalResorts: [Resort] = Bundle.main.decode("resorts.json")
    @State private var resorts: [Resort] = Bundle.main.decode("resorts.json")
    @ObservedObject var favorites = Favorites()

    @State private var selectedSort: SortType = .defaultSort
    @State private var selectedFilter: FilterType = .none
    
    // MARK: Body
    var body: some View {
        NavigationView {
            List(resorts) { resort in
                NavigationLink(destination: ResortView(resort: resort)) {
                    Image(resort.country)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 25)
                        .clipShape(
                            RoundedRectangle(cornerRadius: 5)
                    )
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.black, lineWidth: 1)
                    )
                    
                    VStack(alignment: .leading) {
                        Text(resort.name)
                            .font(.headline)
                        Text("\(resort.runs) runs")
                            .foregroundColor(.secondary)
                    }
                    .layoutPriority(1)

                    if self.favorites.contains(resort) {
                        Spacer()
                        Image(systemName: "heart.fill")
                            .accessibility(label: Text("This is a favorite resort"))
                            .foregroundColor(.red)
                    }
                }
            }
            .navigationBarTitle("Resorts")
            .navigationBarItems(leading: Button(action: setNextFilter, label: {
                Text("Filter")
            }), trailing: Button(action: setNextSort, label: {
                Text("Sort")
            }))
            WelcomeView()
        }
        .environmentObject(favorites)

        // Optional: Extension to Force iPhone 11 Pro Max to behave
        // with stack navigation (not Apple default)
//        .phoneOnlyStackNavigationView()

    }
    
    // MARK: Methods
    func setNextFilter(){
        selectedFilter = selectedFilter.next()
        // Here we call sort first, which will call filter
        sortResorts()
    }
    
    func filterResorts(){
        switch selectedFilter {
            case .none:
                return
            case .austria:
                resorts = resorts.filter {
                    $0.country == "Austria"
                }
            case .france:
                resorts = resorts.filter {
                    $0.country == "France"
                }
            case .italy:
                resorts = resorts.filter {
                    $0.country == "Italy"
                }
            case .us:
                resorts = resorts.filter {
                    $0.country == "United States"
                }
            case .canada:
                resorts = resorts.filter {
                    $0.country == "Canada"
                }
            case .size:
                resorts = resorts.filter {
                    $0.size > 2
                }
            case .price:
                resorts = resorts.filter {
                    $0.price > 2
            }
        }
    }
    
    func setNextSort(){
        selectedSort = selectedSort.next()
        sortResorts()
    }
    
    func sortResorts(){
        switch selectedSort {
            case .defaultSort:
                resorts = originalResorts
                filterResorts()
            case .alphabetical:
                resorts.sort { (resort1, resort2) -> Bool in
                    resort1.name > resort2.name
                }
                filterResorts()
            case .country:
                resorts.sort { (resort1, resort2) -> Bool in
                    resort1.country > resort2.country
                }
                filterResorts()
        }
        //        resorts.sort(by: )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}

extension View {
    func phoneOnlyStackNavigationView() -> some View {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return AnyView(self.navigationViewStyle(StackNavigationViewStyle()))
        } else {
            return AnyView(self)
        }
    }
}
