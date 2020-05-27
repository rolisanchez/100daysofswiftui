//
//  CustomBindingsDemo.swift
//  InstaFilter
//
//  Created by Victor Rolando Sanchez Jara on 5/27/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI

struct CustomBindingsDemo: View {
    @State private var blurAmount: CGFloat = 0

    var body: some View {
        let blur = Binding<CGFloat>(
            get: {
                self.blurAmount
        },
            set: {
                self.blurAmount = $0
                print("New value is \(self.blurAmount)")
        }
        )
        
        return VStack {
            Text("Hello, World!")
                .blur(radius: blurAmount)
            
            Slider(value: blur, in: 0...20)
        }
    }
}

struct CustomBindingsDemo_Previews: PreviewProvider {
    static var previews: some View {
        CustomBindingsDemo()
    }
}
