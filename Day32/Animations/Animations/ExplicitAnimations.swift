//
//  ExplicitAnimations.swift
//  Animations
//
//  Created by Victor Rolando Sanchez Jara on 4/29/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI

struct ExplicitAnimations: View {
    @State private var animationAmount = 0.0

    var body: some View {
        Button("Tap Me") {
            withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
                self.animationAmount += 360
            }
        }
        .padding(50)
        .background(Color.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))

    }
}

struct ExplicitAnimations_Previews: PreviewProvider {
    static var previews: some View {
        ExplicitAnimations()
    }
}
