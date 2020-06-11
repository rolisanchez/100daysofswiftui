//
//  ContentView.swift
//  Day77Challenge
//
//  Created by Victor Rolando Sanchez Jara on 6/11/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    // MARK: Properties
    @Environment(\.managedObjectContext) var moc
    
    @FetchRequest(entity: Friend.entity(), sortDescriptors: [
        NSSortDescriptor(keyPath: \Friend.name, ascending: true),
    ]) var friends: FetchedResults<Friend>
    
    @State private var showingAddScreen = false
    
    // MARK: Body
    var body: some View {
        NavigationView {
            List {
                ForEach(friends, id: \.self) { friend in
                    NavigationLink(destination: FriendDetailsView(friend: friend)) {
                        Text("\(friend.name)")
                        .font(.headline)
                    }
                }
                .onDelete(perform: deleteFriend)
            }
            .navigationBarTitle("FriendsFaces")
            .navigationBarItems(leading: EditButton(), trailing:
                NavigationLink(destination: AddFriendView()) {
                    Image(systemName: "plus")
                }
            )
        }
        
    }
    
    // MARK: Methods
    func deleteFriend(at offsets: IndexSet) {
        for offset in offsets {
            // Find this friend in our fetch request
            let friend = friends[offset]
            // Delete it from the context
            moc.delete(friend)
        }
        // Save the context
        try? moc.save()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
