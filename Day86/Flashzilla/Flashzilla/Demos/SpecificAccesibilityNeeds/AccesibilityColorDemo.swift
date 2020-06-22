//
//  AccesibilityColorDemo.swift
//  Flashzilla
//
//  Created by Victor Rolando Sanchez Jara on 6/22/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI

struct AccesibilityColorDemo: View {
    // MARK: Properties
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor

    // MARK: Body
    var body: some View {
        HStack {
            if differentiateWithoutColor {
                Image(systemName: "checkmark.circle")
            }
            
            Text("Success")
        }
        .padding()
        .background(differentiateWithoutColor ? Color.black : Color.green)
        .foregroundColor(Color.white)
        .clipShape(Capsule())
    }
    
    // MARK: Methods
}

struct AccesibilityColorDemo_Previews: PreviewProvider {
    static var previews: some View {
        AccesibilityColorDemo()
    }
}
