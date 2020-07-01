//
//  SideBySideDemo.swift
//  SnowSeeker
//
//  Created by Victor Rolando Sanchez Jara on 7/1/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI

struct SideBySideDemo: View {
    var body: some View {
        // Example 1
//        NavigationView {
//            Text("Hello, World!")
//                .navigationBarTitle("Primary")
//
//            Text("Secondary")
//        }
        // Example 2
        NavigationView {
            NavigationLink(destination: Text("New secondary")) {
                Text("Hello, World!")
            }
            .navigationBarTitle("Primary")
            
            Text("Secondary")
        }
    }
}

struct SideBySideDemo_Previews: PreviewProvider {
    static var previews: some View {
        SideBySideDemo()
    }
}
