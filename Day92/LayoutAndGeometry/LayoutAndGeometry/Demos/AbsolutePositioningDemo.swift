//
//  AbsolutePositioningDemo.swift
//  LayoutAndGeometry
//
//  Created by Victor Rolando Sanchez Jara on 6/28/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI

struct AbsolutePositioningDemo: View {
    let example = 2
    var body: some View {
        Group {
            if example == 1 {
                Text("Hello, world!")
                    .background(Color.red)
                    .position(x: 100, y: 100)
//                    .background(Color.blue)
            } else if example == 2 {
                Text("Hello, world!")
//                    .background(Color.blue)
                    .offset(x: 100, y: 100)
                    .background(Color.red)
            }
        }
    }
}

struct AbsolutePositioningDemo_Previews: PreviewProvider {
    static var previews: some View {
        AbsolutePositioningDemo()
    }
}
