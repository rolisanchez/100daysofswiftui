//
//  EnablingMetal.swift
//  Drawing
//
//  Created by Victor Rolando Sanchez Jara on 5/10/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI

struct EnablingMetal: View {
    @State private var colorCycle = 0.0
    
    var body: some View {
        VStack {
            ColorCyclingCircle(amount: self.colorCycle)
                .frame(width: 300, height: 300)
            
            Slider(value: $colorCycle)
        }
    }
}

struct EnablingMetal_Previews: PreviewProvider {
    static var previews: some View {
        EnablingMetal()
    }
}

