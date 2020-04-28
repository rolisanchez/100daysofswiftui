//
//  CustomAnimations.swift
//  Animations
//
//  Created by Victor Rolando Sanchez Jara on 4/28/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI

struct CustomAnimations: View {
    @State private var animationAmount: CGFloat = 1

    var body: some View {
        Button("Tap Me") {
            self.animationAmount += 0.5
        }
        .padding(50)
        .background(Color.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .overlay(
            Circle()
                .stroke(Color.red)
                .scaleEffect(animationAmount)
                .opacity(Double(2 - animationAmount))
                
                .animation(
                    Animation.easeInOut(duration: 1)
                        .repeatForever(autoreverses: false)
            )
            
        )
            .onAppear {
                self.animationAmount = 2
        }
        //        .scaleEffect(animationAmount)
        //        .animation(.default)
        //        .animation(.easeOut)
        //        .animation(.interpolatingSpring(stiffness: 50, damping: 1))
        //        .animation(.easeInOut(duration: 2))
        //        .animation(
        //            Animation.easeInOut(duration: 2)
        //                .delay(1)
        //        )
        //        .animation(
        //            Animation.easeInOut(duration: 1)
        //                .repeatCount(3, autoreverses: true)
        //        )
        //        .animation(
        //            Animation.easeInOut(duration: 1)
        //                .repeatForever(autoreverses: true)
        //        )
        //        .blur(radius: (animationAmount - 1) * 3)

    }
}

struct CustomAnimations_Previews: PreviewProvider {
    static var previews: some View {
        CustomAnimations()
    }
}
