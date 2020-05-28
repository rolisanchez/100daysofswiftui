//
//  ImagePicker.swift
//  InstaFilter
//
//  Created by Victor Rolando Sanchez Jara on 5/28/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    // Just use this in the beginning as a shortcut :)
//    typealias UIViewControllerType = UIImagePickerController

    // Xcode will generate the two methods below based on the shortcut above
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        // Not using for now
    }
    
}
