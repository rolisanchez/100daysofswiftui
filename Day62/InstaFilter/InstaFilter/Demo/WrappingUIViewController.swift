//
//  WrappingUIViewController.swift
//  InstaFilter
//
//  Created by Victor Rolando Sanchez Jara on 5/28/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI

struct WrappingUIViewController: View {
    // MARK: Properties
    @State private var image: Image?
    @State private var showingImagePicker = false
    
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
        .sheet(isPresented: $showingImagePicker) {
            ImagePicker()
        }
    }
    
    // MARK: Methods
}

struct WrappingUIViewController_Previews: PreviewProvider {
    static var previews: some View {
        WrappingUIViewController()
    }
}
