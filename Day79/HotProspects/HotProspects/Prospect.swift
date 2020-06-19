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
//    var isContacted = false
    // We set isConacted to filaprivate(set) so no one can set this value except the contents of this file
    // That's why we have Prospect and Prospects in the same file, so Prospects' toggle can set the file
    fileprivate(set) var isContacted = false

}

class Prospects: ObservableObject {
    static let saveKey = "SavedData"

//    @Published var people: [Prospect]
    @Published private(set) var people: [Prospect]

//    init() {
//        self.people = []
//    }
    // Init with UserDefaults
    init() {
        if let data = UserDefaults.standard.data(forKey: Self.saveKey) {
            if let decoded = try? JSONDecoder().decode([Prospect].self, from: data) {
                self.people = decoded
                return
            }
        }
        
        self.people = []
    }
    
    private func save() {
        if let encoded = try? JSONEncoder().encode(people) {
            UserDefaults.standard.set(encoded, forKey: Self.saveKey)
        }
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
}
