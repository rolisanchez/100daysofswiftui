//
//  Prospect.swift
//  HotProspects
//
//  Created by Victor Rolando Sanchez Jara on 6/17/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import Foundation

class Prospect: Identifiable, Codable {
    let id = UUID()
    var name = "Anonymous"
    var emailAddress = ""
    let created: Date = Date()
//    var isContacted = false
    // We set isConacted to filaprivate(set) so no one can set this value except the contents of this file
    // That's why we have Prospect and Prospects in the same file, so Prospects' toggle can set the file
    fileprivate(set) var isContacted = false

}

class Prospects: ObservableObject {
    enum SortCriteria {
        case name, email
    }
    
    static let saveKey = "SavedData"
    static let saveJsonKey = "SavedData.json"

//    @Published var people: [Prospect]
    @Published private(set) var people: [Prospect]

//    init() {
//        self.people = []
//    }
    // Init with UserDefaults
    init() {
        let path = getDocumentsDirectory().appendingPathComponent(Self.saveJsonKey)
        
        if let data = try? Data(contentsOf: path) {
            if let decoded = try? JSONDecoder().decode([Prospect].self, from: data) {
                self.people = decoded
                return
            }
        }
        
//        if let data = UserDefaults.standard.data(forKey: Self.saveKey) {
//            if let decoded = try? JSONDecoder().decode([Prospect].self, from: data) {
//                self.people = decoded
//                return
//            }
//        }
        
        self.people = []
    }
    
    private func save() {
        let path = getDocumentsDirectory().appendingPathComponent(Self.saveJsonKey)
        
        // Save as a JSON File
        if let encoded = try? JSONEncoder().encode(people) {
            do {
                try encoded.write(to: path)
            } catch {
                print(error.localizedDescription)
            }
        }
//        if let encoded = try? JSONEncoder().encode(people) {
//            UserDefaults.standard.set(encoded, forKey: Self.saveKey)
//        }
    }
    
    // Need to save with UserDefaults if changes
//    func toggle(_ prospect: Prospect) {
//        objectWillChange.send()
//        prospect.isContacted.toggle()
//    }
    func toggle(_ prospect: Prospect) {
        objectWillChange.send()
        prospect.isContacted.toggle()
        save()
    }
    
    func add(_ prospect: Prospect) {
        people.append(prospect)
        save()
    }
    
    func sortBy(criteria: SortCriteria){
        switch criteria {
            case .name:
                print("Sort by name")
                people.sort {
                    $0.name < $1.name
                }
            case .email:
                print("Sort by email")
                people.sort {
                    $0.emailAddress < $1.emailAddress
                }
        }
    }
}

func getDocumentsDirectory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return paths[0]
}
