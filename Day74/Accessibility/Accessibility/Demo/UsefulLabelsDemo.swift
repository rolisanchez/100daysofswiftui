//
//  UsefulLabelsDemo.swift
//  Accessibility
//
//  Created by Victor Rolando Sanchez Jara on 6/8/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI

struct UsefulLabelsDemo: View {
    // MARK: Properties
    let pictures = [
        "ales-krivec-15949",
        "galina-n-189483",
        "kevin-horstmann-141705",
        "nicolas-tissot-335096"
    ]
    
    let labels = [
        "Tulips",
        "Frozen tree buds",
        "Sunflowers",
        "Fireworks",
    ]
    
    
    @State private var selectedPicture = Int.random(in: 0...3)
    
    // MARK: Body
    var body: some View {
        Image(pictures[selectedPicture])
            .resizable()
            .scaledToFit()
            .onTapGesture {
                self.selectedPicture = Int.random(in: 0...3)
        }
        .accessibility(label: Text(labels[selectedPicture]))
        .accessibility(addTraits: .isButton)
        .accessibility(removeTraits: .isImage)
        
        
    }
    
    // MARK: Methods
}

struct UsefulLabelsDemo_Previews: PreviewProvider {
    static var previews: some View {
        UsefulLabelsDemo()
    }
}
