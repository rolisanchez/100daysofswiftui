//
//  DisablingInteractivityDemo.swift
//  Flashzilla
//
//  Created by Victor Rolando Sanchez Jara on 6/21/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI

//struct DisablingInteractivityDemo: View {
//    var body: some View {
//        ZStack {
//            Rectangle()
//                .fill(Color.blue)
//                .frame(width: 300, height: 300)
//                .onTapGesture {
//                    print("Rectangle tapped!")
//            }
//
//            Circle()
//                .fill(Color.red)
//                .frame(width: 300, height: 300)
////                .contentShape(Rectangle())
//                .onTapGesture {
//                    print("Circle tapped!")
//            }
////            .allowsHitTesting(false)
////            Text("Hello                    world")
////                .onTapGesture {
////                    print("Text tapped!")
////
////            }
//        }
//    }
//}

struct DisablingInteractivityDemo: View {
        var body: some View {
            VStack {
                Text("Hello")
                Spacer().frame(height: 100)
                Text("World")
            }
//            .contentShape(Rectangle())
            .onTapGesture {
                print("VStack tapped!")
            }
    }
    
}

struct DisablingInteractivityDemo_Previews: PreviewProvider {
    static var previews: some View {
        DisablingInteractivityDemo()
    }
}
