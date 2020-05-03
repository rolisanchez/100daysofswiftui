//
//  ArchivingCodable.swift
//  iExpense
//
//  Created by Victor Rolando Sanchez Jara on 5/3/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI

struct ArchivingCodable: View {
    @State private var user = User(firstName: "Taylor", lastName: "Swift")
    
    var body: some View {
        Button("Save User") {
            let encoder = JSONEncoder()
            
            if let data = try? encoder.encode(self.user) {
                UserDefaults.standard.set(data, forKey: "UserData")
            }
        }
    }
}

struct ArchivingCodable_Previews: PreviewProvider {
    static var previews: some View {
        ArchivingCodable()
    }
}

struct User: Codable {
    var firstName: String
    var lastName: String
}
