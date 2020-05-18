//
//  CustomComponentBinding.swift
//  Bookworm
//
//  Created by Victor Rolando Sanchez Jara on 5/18/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI

struct CustomComponentBinding: View {
    @State private var rememberMe = false

    var body: some View {
//        Toggle(isOn: $rememberMe) {
//            Text("Remember Me")
//        }
        VStack {
            PushButton(title: "Remember Me", isOn: $rememberMe)
            Text(rememberMe ? "On" : "Off")
        }
    }
}

struct CustomComponentBinding_Previews: PreviewProvider {
    static var previews: some View {
        CustomComponentBinding()
    }
}

// MARK: Push Button View
struct PushButton: View {
    let title: String
    @Binding var isOn: Bool
    
    var onColors: [Color] = [.red, .yellow]
    var offColors = [Color(white: 0.6), Color(white: 0.4)]
    
    var body: some View {
        Button(title) {
            self.isOn.toggle()
        }
        .padding()
        .background(LinearGradient(gradient: Gradient(colors: isOn ? onColors : offColors), startPoint: .top, endPoint: .bottom))
        .foregroundColor(.white)
        .clipShape(Capsule())
        .shadow(radius: isOn ? 0 : 5)
    }
}
