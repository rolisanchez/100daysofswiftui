//
//  AddFriendView.swift
//  Day77Challenge
//
//  Created by Victor Rolando Sanchez Jara on 6/11/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI

struct AddFriendView: View {
    // MARK: Properties
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
    
    // Friend's Image
    @State private var image: Image?
    @State private var inputImage: UIImage?
    @State private var showingImagePicker = false
    
    // Other friend's properties
    @State private var name = ""
    
    var invalidName: Bool {
        return name.trimmingCharacters(in: .whitespaces).isEmpty
    }
    
    var invalidImage: Bool {
        return image == nil
    }
    // Location Related
    let locationFetcher = LocationFetcher()
    
    // MARK: Body
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .fill(Color.secondary)
                if image != nil {
                    image?
                        .resizable()
                        .scaledToFit()
                } else {
                    Text("Tap to select a picture")
                        .foregroundColor(.white)
                        .font(.headline)
                }
            }
            .onTapGesture {
                self.showingImagePicker = true
            }
            
            Form {
                Section {
                    TextField("Friend's name", text: $name)
                }
                Section {
                    Button(action: {
                        self.saveNewFriend()
                    }, label: {
                        Text("Save")
                    })
                    .disabled(invalidName || invalidImage)
                }
            }
        }
        .padding([.horizontal, .bottom])
        .navigationBarTitle("New Friend")
        .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
            ImagePicker(image: self.$inputImage)
        }
        .onAppear { self.locationFetcher.start() }
        
    }
    // MARK: Methods
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
    }
    
    func saveNewFriend(){
        // First, generate an UUID
        let imageUUID = UUID()
        if let image = inputImage {
            if let data = image.pngData() {
                // Save image on Bundle with filename as UUID
                let filename = getDocumentsDirectory().appendingPathComponent(imageUUID.uuidString)
                try? data.write(to: filename)
                // Save into DB with friend's name and UUID
                let newFriend = Friend(context: self.moc)
                newFriend.name = name
                newFriend.image = imageUUID
                
                if let location = self.locationFetcher.lastKnownLocation {
                    newFriend.latitude = location.latitude
                    newFriend.longitude = location.longitude
                } else {
                    print("Your location is unknown")
                }
                
                try? self.moc.save()
                self.presentationMode.wrappedValue.dismiss()
            }
        }
        
        
    }
    
}

struct AddFriendView_Previews: PreviewProvider {
    static var previews: some View {
        AddFriendView()
    }
}
