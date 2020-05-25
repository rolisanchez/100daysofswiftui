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
    @State private var users = [User]()
    // MARK: Body
    var body: some View {
        NavigationView {
            List {
                ForEach(users, id: \.id) { user in
                    NavigationLink(destination: UserDetail(user: user, users: self.users)) {
                        VStack(alignment: .leading) {
                            Text(user.name)
                                .font(.headline)
                                .foregroundColor(.black)
                            Text(user.email)
                                .foregroundColor(.secondary)
                        }
                    }
                    
                }
            }
            .navigationBarTitle("FriendFace")
        }
        .onAppear(perform: getRequest)
    }
    
    // MARK: Methods
    func getRequest() {
        let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
        
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let data = data else {
                print("No data in response: \(error?.localizedDescription ?? "Unknown error").")
                
                return
            }
            
            if let decodedUsers = try? JSONDecoder().decode([User].self, from: data) {
                self.users = decodedUsers
//
            } else {
                print("Could not decode")
            }
//            print(String(data: data, encoding: .utf8) ?? "No data")
        }.resume()

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
