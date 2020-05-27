//
//  PropertyWrapperStructs.swift
//  InstaFilter
//
//  Created by Victor Rolando Sanchez Jara on 5/27/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI

struct PropertyWrapperStructs: View {
    @State private var blurAmount: CGFloat = 0 {
        didSet {
            print("New value is \(blurAmount)")
        }
    }
    // Did set doesn't get called
    // what it’s actually saying is that when the State struct that wraps blurAmount changes, print out the new blur amount.
    
    var body: some View {
        VStack {
            Text("Hello, World!")
                .blur(radius: blurAmount)
            
            Slider(value: $blurAmount, in: 0...20)
        }
    }
}

struct PropertyWrapperStructs_Previews: PreviewProvider {
    static var previews: some View {
        PropertyWrapperStructs()
    }
}
