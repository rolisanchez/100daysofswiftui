//
//  SpecialEffectsDemo.swift
//  Drawing
//
//  Created by Victor Rolando Sanchez Jara on 5/11/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI

struct SpecialEffectsDemo: View {
    @State private var amount: CGFloat = 0.0

    var body: some View {
//        ZStack {
//            Image("Example")
            // Multiply with a shape
//            Rectangle()
//                .fill(Color.red)
//                .blendMode(.multiply)
            // Multiply shortcut
//                .colorMultiply(.red)
            // Screen effect (opposite of multiply)
//            Rectangle()
//                .fill(Color.red)
//                .blendMode(.screen)
//        }
//        .frame(width: 400, height: 500)
//        .clipped()
        
        // Another example:
//        VStack {
//            ZStack {
//                Circle()
////                    .fill(Color.red) // Adaptive red
//                    .fill(Color(red: 1, green: 0, blue: 0)) // Real Red
//
//                    .frame(width: 200 * amount)
//                    .offset(x: -50, y: -80)
//                    .blendMode(.screen)
//
//                Circle()
////                    .fill(Color.green) // Adaptive green
//                    .fill(Color(red: 0, green: 1, blue: 0)) // Real green
//
//                    .frame(width: 200 * amount)
//                    .offset(x: 50, y: -80)
//                    .blendMode(.screen)
//
//                Circle()
////                    .fill(Color.blue) // Adaptive blue
//                    .fill(Color(red: 0, green: 0, blue: 1)) // Real blue
//                    .frame(width: 200 * amount)
//                    .blendMode(.screen)
//            }
//            .frame(width: 300, height: 300)
//
//            Slider(value: $amount)
//                .padding()
//        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .background(Color.black)
//        .edgesIgnoringSafeArea(.all)
        
        // Another example
        VStack {
            Image("Example")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .saturation(Double(amount))
                .blur(radius: (1 - amount) * 20)
            Slider(value: $amount)
            .padding()
        }
    }
}

struct SpecialEffectsDemo_Previews: PreviewProvider {
    static var previews: some View {
        SpecialEffectsDemo()
    }
}
