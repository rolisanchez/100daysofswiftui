//
//  Activity.swift
//  Day47Challenge
//
//  Created by Victor Rolando Sanchez Jara on 5/12/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import Foundation

struct Activity: Codable, Identifiable {
    let id = UUID()
    let name: String
    let description: String
    var count: Int
}
