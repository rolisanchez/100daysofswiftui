//
//  FriendDetailsView.swift
//  Day77Challenge
//
//  Created by Victor Rolando Sanchez Jara on 6/11/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI
import CoreData
import MapKit

struct FriendDetailsView: View {
    // MARK: Properties
    let friend: Friend
    let friendImage: Image
    
    let centerCoordinate: CLLocationCoordinate2D
    
    let selectedPlace:  MKPointAnnotation
    
    init(friend: Friend) {
        self.friend = friend
        let filename = getDocumentsDirectory().appendingPathComponent(friend.image.uuidString)
        
        let image = UIImage(contentsOfFile: filename.path)
        friendImage = Image(uiImage: image!)
        
        let friendCoordinates = CLLocationCoordinate2D(latitude: friend.latitude, longitude: friend.longitude)
        centerCoordinate = friendCoordinates
        
        let codableAnnotation = CodableMKPointAnnotation()
        
        codableAnnotation.coordinate = friendCoordinates
        codableAnnotation.title = "Met \(friend.name) here!"
        
        self.selectedPlace = codableAnnotation
        
    }
    
    // MARK: Body
    var body: some View {
        VStack {
            friendImage
                .resizable()
                .scaledToFit()
            Text("Name: ")
            .font(.headline)
            + Text("\(friend.name)")
            Text("Latitude: \(friend.latitude)")
                .font(.headline)
            Text("Longitude: \(friend.longitude)")
                .font(.headline)
            
            Text("Location where you met your friend:")
            .font(.headline)
            MapView(centerCoordinate: centerCoordinate, selectedPlace: selectedPlace, annotations: [selectedPlace])
            
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
