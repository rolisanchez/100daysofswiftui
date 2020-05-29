//
//  UsingCoordinatorsAndSaving.swift
//  InstaFilter
//
//  Created by Victor Rolando Sanchez Jara on 5/29/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI

struct UsingCoordinatorsAndSaving: View {
    // MARK: Properties
    @State private var image: Image?
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?

    // MARK: Body
    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()
            
            Button("Select Image") {
                self.showingImagePicker = true
            }
        }
        .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
            ImagePicker(image: self.$inputImage)
        }
    }
    // MARK: Methods
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
        // This duplicates the image
        //        UIImageWriteToSavedPhotosAlbum(inputImage, nil, nil, nil)
        // Using Image saver to get errors:
        //        let imageSaver = ImageSaver()
        //        imageSaver.writeToPhotoAlbum(image: inputImage)
        
    }
}

struct UsingCoordinatorsAndSaving_Previews: PreviewProvider {
    static var previews: some View {
        UsingCoordinatorsAndSaving()
    }
}


class ImageSaver: NSObject {
    func writeToPhotoAlbum(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveError), nil)
    }
    
    @objc func saveError(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        print("Save finished!")
    }
}
