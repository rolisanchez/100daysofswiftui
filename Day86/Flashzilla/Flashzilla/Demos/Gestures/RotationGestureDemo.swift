//
//  RotationGestureDemo.swift
//  Flashzilla
//
//  Created by Victor Rolando Sanchez Jara on 6/21/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI

struct RotationGestureDemo: View {
    @State private var currentAmount: Angle = .degrees(0)
    @State private var finalAmount: Angle = .degrees(0)
    
    var body: some View {
        Text("Hello, World!")
            .rotationEffect(currentAmount + finalAmount)
            .gesture(
                RotationGesture()
                    .onChanged { angle in
                        self.currentAmount = angle
                }
                .onEnded { angle in
                    self.finalAmount += self.currentAmount
                    self.currentAmount = .degrees(0)
                }
        )
    }
}

struct RotationGestureDemo_Previews: PreviewProvider {
    static var previews: some View {
        RotationGestureDemo()
    }
}
