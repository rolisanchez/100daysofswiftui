//
//  ClashingGestureDemo.swift
//  Flashzilla
//
//  Created by Victor Rolando Sanchez Jara on 6/21/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI

struct ClashingGestureDemo: View {
    var body: some View {
        VStack {
            Text("Hello, World!")
                .onTapGesture {
                    print("Text tapped")
            }
        }
        // Clashing
//        .onTapGesture {
//            print("VStack tapped")
//        }
        
        // High Priority
//            .highPriorityGesture(
//                TapGesture()
//                    .onEnded { _ in
//                        print("VStack tapped")
//                }
//        )
        
        // Simultaneous
            .simultaneousGesture(
                TapGesture()
                    .onEnded { _ in
                        print("VStack tapped")
                }
        )
    }
}

struct ClashingGestureDemo_Previews: PreviewProvider {
    static var previews: some View {
        ClashingGestureDemo()
    }
}
