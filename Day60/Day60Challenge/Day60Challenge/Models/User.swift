//
//  User.swift
//  Day60Challenge
//
//  Created by Victor Rolando Sanchez Jara on 5/25/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import Foundation

struct User: Codable {
    var id: String
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    var registered: String
    var tags: [String]
    var friends: [Friend]
    
    var tagsString: String {
        var str = ""
        
        for i in 0..<tags.count {
            str += tags[i]
            if i != tags.count-1 {
                str += ", "
            }
        }
        return str
    }
}
