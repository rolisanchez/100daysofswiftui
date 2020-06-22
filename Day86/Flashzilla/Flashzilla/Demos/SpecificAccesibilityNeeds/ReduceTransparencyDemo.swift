//
//  ReduceTransparencyDemo.swift
//  Flashzilla
//
//  Created by Victor Rolando Sanchez Jara on 6/22/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI

struct ReduceTransparencyDemo: View {
    // MARK: Properties
    @Environment(\.accessibilityReduceTransparency) var reduceTransparency
    // MARK: Body
    var body: some View {
        Text("Hello, World!")
            .padding()
            .background(reduceTransparency ? Color.black : Color.black.opacity(0.5))
            .foregroundColor(Color.white)
            .clipShape(Capsule())
    }
}

struct ReduceTransparencyDemo_Previews: PreviewProvider {
    static var previews: some View {
        ReduceTransparencyDemo()
    }
}
