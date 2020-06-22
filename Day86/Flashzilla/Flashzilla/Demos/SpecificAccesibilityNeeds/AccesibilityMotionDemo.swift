//
//  AccesibilityMotionDemo.swift
//  Flashzilla
//
//  Created by Victor Rolando Sanchez Jara on 6/22/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI

struct AccesibilityMotionDemo: View {
    // MARK: Properties
//    @Environment(\.accessibilityReduceMotion) var reduceMotion
//    @State private var scale: CGFloat = 1
//
//    // MARK: Body
//    var body: some View {
//        Text("Hello, World!")
//            .scaleEffect(scale)
//            .onTapGesture {
//                if self.reduceMotion {
//                    self.scale *= 1.5
//                } else {
//                    withAnimation {
//                        self.scale *= 1.5
//                    }
//                }
//        }
//    }
    
    // Alternative Implementation
    // MARK: Properties
    @State private var scale: CGFloat = 1
    // MARK: Body
    var body: some View {
        Text("Hello, World!")
            .scaleEffect(scale)
            .onTapGesture {
                self.withOptionalAnimation {
                    self.scale *= 1.5
                }
        }
    }
    
    // MARK: Methods
    func withOptionalAnimation<Result>(_ animation: Animation? = .default, _ body: () throws -> Result) rethrows -> Result {
        if UIAccessibility.isReduceMotionEnabled {
            return try body()
        } else {
            return try withAnimation(animation, body)
        }
    }
}

struct AccesibilityMotionDemo_Previews: PreviewProvider {
    static var previews: some View {
        AccesibilityMotionDemo()
    }
}
