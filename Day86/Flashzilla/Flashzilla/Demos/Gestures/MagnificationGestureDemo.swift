//
//  MagnificationGestureDemo.swift
//  Flashzilla
//
//  Created by Victor Rolando Sanchez Jara on 6/21/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI

struct MagnificationGestureDemo: View {
    @State private var currentAmount: CGFloat = 0
    @State private var finalAmount: CGFloat = 1
    
    var body: some View {
        Text("Hello, World!")
            .scaleEffect(finalAmount + currentAmount)
            .gesture(
                MagnificationGesture()
                    .onChanged { amount in
                        self.currentAmount = amount - 1
                }
                .onEnded { amount in
                    self.finalAmount += self.currentAmount
                    self.currentAmount = 0
                }
        )
    }
}

struct MagnificationGestureDemo_Previews: PreviewProvider {
    static var previews: some View {
        MagnificationGestureDemo()
    }
}
