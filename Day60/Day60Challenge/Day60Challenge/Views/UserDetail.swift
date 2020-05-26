//
//  UserDetail.swift
//  Day60Challenge
//
//  Created by Victor Rolando Sanchez Jara on 5/25/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI
import CoreData

struct UserDetail: View {

    var id: String!
//    var user: User!
//    var users: [User]
//    @FetchRequest(entity: User.entity(), sortDescriptors: []) var users: FetchedResults<User>
//    @FetchRequest(entity: User.entity(), sortDescriptors: [], predicate: NSPredicate(format: "id IS %@", id)) var user: FetchedResults<User>
    var fetchRequest: FetchRequest<User>
    var users: FetchedResults<User> { fetchRequest.wrappedValue }

    init(id: String){
        fetchRequest = FetchRequest<User>(entity: User.entity(), sortDescriptors: [], predicate: NSPredicate(format: "id == %@", id))
    }
    
    var body: some View {
        ScrollView {
        VStack(alignment: .leading, spacing: 12.0) {
            
            Group {
                HStack {
                    Text("User id:").fontWeight(.bold)
//                    Text("\(user.id)")
                    Text("\(users.first!.wrappedId)")
                }
                HStack {
                    Text("Is active?").fontWeight(.bold)
                    Text("\(users.first!.isActive ? "true" : "false")")
                }
                HStack {
                    Text("Name:").fontWeight(.bold)
//                    Text("\(user.name)")
                    Text("\(users.first!.wrappedName)")
                }
                HStack {
                    Text("Age:").fontWeight(.bold)
                    Text("\(users.first!.age)")
                }
                HStack {
                    Text("Company:").fontWeight(.bold)
//                    Text("\(user.company)")
                    Text("\(users.first!.wrappedCompany)")
                }
                HStack {
                    Text("Email:").fontWeight(.bold)
//                    Text("\(user.email)")
                    Text("\(users.first!.wrappedEmail)")
                }
            }
            Group {
                HStack {
                    Text("Address:").fontWeight(.bold)
//                    Text("\(user.address)")
                    Text("\(users.first!.wrappedAddress)")
                }
                HStack {
                    Text("About:").fontWeight(.bold)
//                    Text("\(user.about)")
                    Text("\(users.first!.wrappedAbout)")
                }
                HStack {
                    Text("Registered:").fontWeight(.bold)
//                    Text("\(user.registered)")
                    Text("\(users.first!.formattedRegisteredDate)")
                }
                HStack {
                    Text("Tags:").fontWeight(.bold)
                    Text("\(users.first!.tagsString)")
                }
                Text("Friends")
                    .font(.title)
            }
//            List {
//                ForEach(user.friends, id: \.id) { friend in
//                    NavigationLink(destination: UserDetail(user: self.users.first(where: { $0.id == friend.id}), users: self.users)) {
//                        VStack(alignment: .leading, spacing: 12.0) {
//                            Text("\(friend.name)")
//                            .foregroundColor(.secondary)
//
//                        }
//                    }
//                }
//            }
            List {
                ForEach(users.first!.friendsArray, id: \.id) { friend in
                    NavigationLink(destination: UserDetail(id: friend.id!)) {
                        VStack(alignment: .leading, spacing: 12.0) {
                            Text("\(friend.name!)")
                                .foregroundColor(.secondary)
                            
                        }
                    }
                }
            }
            
        }
        }
        .navigationBarTitle("\(users.first!.wrappedName)")
    }
}

struct UserDetail_Previews: PreviewProvider {
    static let moc = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    
    static var previews: some View {
//        let createdUser = User(id: "asd", isActive: false, name: "name", age: 12, company: "Company", email: "email", address: "address", about: "about", registered: "late", tags: [], friends: [])
        
//        let user = User(context: moc)
//        user.id = "id"
//        user.isActive = false
//        user.name = "name"
//        user.age = Int16(25)
//        user.company = "company"
//        user.email = "email@gmail.com"
//        user.address = "address"
//        user.about = "about"
//        user.registered = Date()
//        user.tags = []
//        user.friends = []
        
        return UserDetail(id: "e6fa1d2-527c-41e9-9da0-2d89eb0b8d6a")
    }
}
