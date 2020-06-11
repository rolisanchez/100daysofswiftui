//
//  FriendDetailsView.swift
//  Day77Challenge
//
//  Created by Victor Rolando Sanchez Jara on 6/11/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI
import CoreData

struct FriendDetailsView: View {
    // MARK: Properties
    let friend: Friend
    let friendImage: Image
    
    init(friend: Friend) {
        self.friend = friend
        let filename = getDocumentsDirectory().appendingPathComponent(friend.image.uuidString)
        let image = UIImage(contentsOfFile: filename.path)
        friendImage = Image(uiImage: image!)
    }
    
    // MARK: Body
    var body: some View {
        VStack {
            friendImage
                .resizable()
                .scaledToFit()
            Text("Name: \(friend.name)")
            .font(.headline)
        }
        .navigationBarTitle("Friend Details")
    }
    
    // MARK: Methods
}

struct FriendDetailsView_Previews: PreviewProvider {
    static let moc = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    
    static var previews: some View {
        let friend = Friend(context: moc)
        friend.name = "Test name"
        friend.image = UUID()
        
        return NavigationView {
            FriendDetailsView(friend: friend)
        }
    }
}
