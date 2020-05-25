//
//  UserDetail.swift
//  Day60Challenge
//
//  Created by Victor Rolando Sanchez Jara on 5/25/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI

struct UserDetail: View {
    var user: User!
    var users: [User]
    
    var body: some View {
        ScrollView {
        VStack(alignment: .leading, spacing: 12.0) {
            
            Group {
                HStack {
                    Text("User id:").fontWeight(.bold)
                    Text("\(user.id)")
                }
                HStack {
                    Text("Is active?").fontWeight(.bold)
                    Text("\(user.isActive ? "true" : "false")")
                }
                HStack {
                    Text("Name:").fontWeight(.bold)
                    Text("\(user.name)")
                }
                HStack {
                    Text("Age:").fontWeight(.bold)
                    Text("\(user.age)")
                }
                HStack {
                    Text("Company:").fontWeight(.bold)
                    Text("\(user.company)")
                }
                HStack {
                    Text("Email:").fontWeight(.bold)
                    Text("\(user.email)")
                }
            }
            Group {
                HStack {
                    Text("Address:").fontWeight(.bold)
                    Text("\(user.address)")
                }
                HStack {
                    Text("About:").fontWeight(.bold)
                    Text("\(user.about)")
                }
                HStack {
                    Text("Registered:").fontWeight(.bold)
                    Text("\(user.registered)")
                }
                HStack {
                    Text("Tags:").fontWeight(.bold)
                    Text("\(user.tagsString)")
                }
                Text("Friends")
                    .font(.title)
            }
            List {
                ForEach(user.friends, id: \.id) { friend in
                    NavigationLink(destination: UserDetail(user: self.users.first(where: { $0.id == friend.id}), users: self.users)) {
                        VStack(alignment: .leading, spacing: 12.0) {
                            Text("\(friend.name)")
                            .foregroundColor(.secondary)
                            
                        }
                    }
                }
            }
        }
        }
        .navigationBarTitle("\(user.name)")
    }
}

struct UserDetail_Previews: PreviewProvider {
    static var previews: some View {
        let createdUser = User(id: "asd", isActive: false, name: "name", age: 12, company: "Company", email: "email", address: "address", about: "about", registered: "late", tags: [], friends: [])
        return UserDetail(user: createdUser, users: [])
    }
}
