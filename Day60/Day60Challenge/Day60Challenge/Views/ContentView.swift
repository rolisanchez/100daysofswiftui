//
//  ContentView.swift
//  Day60Challenge
//
//  Created by Victor Rolando Sanchez Jara on 5/25/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    // MARK: Properties
    // Without Core Data:
//    @State private var users = [User]()
    // Using Core Data
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: User.entity(), sortDescriptors: []) var users: FetchedResults<User>
    
    // MARK: Body
    var body: some View {
        NavigationView {
//            List {
//                ForEach(users, id: \.id) { user in
//                    NavigationLink(destination: UserDetail(user: user, users: self.users)) {
//                        VStack(alignment: .leading) {
//                            Text(user.name)
//                                .font(.headline)
//                                .foregroundColor(.black)
//                            Text(user.email)
//                                .foregroundColor(.secondary)
//                        }
//                    }
//
//                }
//            }
            List {
                ForEach(users, id: \.id) { user in
                    NavigationLink(destination: UserDetail(id: user.wrappedId)) {
                        VStack(alignment: .leading) {
                            Text(user.wrappedName)
                                .font(.headline)
                                .foregroundColor(.black)
                            Text(user.wrappedEmail)
                                .foregroundColor(.secondary)
                        }
                    }
                    
                }
            }
//            Text("Friends")
            .navigationBarTitle("FriendFace")
        }
//        .onAppear(perform: getRequest)
        .onAppear(perform: loadUsers)
    }
    
    // MARK: Methods
//    func getRequest() {
//        let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
//
//        var request = URLRequest(url: url)
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.httpMethod = "GET"
//
//        URLSession.shared.dataTask(with: request) { data, response, error in
//
//            guard let data = data else {
//                print("No data in response: \(error?.localizedDescription ?? "Unknown error").")
//
//                return
//            }
//
//            if let decodedUsers = try? JSONDecoder().decode([DecodeUser].self, from: data) {
//
////                self.users = decodedUsers
////
//            } else {
//                print("Could not decode")
//            }
////            print(String(data: data, encoding: .utf8) ?? "No data")
//        }.resume()
//
//    }

    func loadUsers() {
        guard users.count == 0 else {
            return
        }
        
        let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
        
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let data = data else {
                print("No data in response: \(error?.localizedDescription ?? "Unknown error").")
                
                return
            }
            
            if let decodedUsers = try? JSONDecoder().decode([DecodeUser].self, from: data) {
                for user in decodedUsers {
                    let createUser = User(context: self.moc)
                    createUser.id = user.id
                    createUser.isActive = user.isActive
                    createUser.name = user.name
                    createUser.age = Int16(user.age)
                    createUser.company = user.company
                    createUser.email = user.email
                    createUser.address = user.address
                    createUser.about = user.about
                    let formatter = DateFormatter()
                    // "2015-11-10T01:47:18-00:00"
                    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssxxxxx"
                    createUser.registered = formatter.date(from: user.registered)
                    
                    for tag in user.tags {
                        let createTag = Tag(context: self.moc)
                        createTag.name = tag
                        createUser.tags.insert(createTag)
                    }
                    
                    for friend in user.friends {
                        let createFriend = Friend(context: self.moc)
                        createFriend.id = friend.id
                        createFriend.name = friend.name
                        createUser.friends.insert(createFriend)
                    }
                }
                
                try? self.moc.save()
            } else {
                print("Could not decode")
            }
        }.resume()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
