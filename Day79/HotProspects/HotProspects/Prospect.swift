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
    @Published var people: [Prospect]
    
    init() {
        self.people = []
    }
    
    func toggle(_ prospect: Prospect) {
        objectWillChange.send()
        prospect.isContacted.toggle()
    }
}
