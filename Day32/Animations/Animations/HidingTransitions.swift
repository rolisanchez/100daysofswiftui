//
//  HidingTransitions.swift
//  Animations
//
//  Created by Victor Rolando Sanchez Jara on 4/29/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI

struct HidingTransitions: View {
    @State private var isShowingRed = false
    
    var body: some View {
        VStack {
            Button("Tap Me") {
                withAnimation {
                    self.isShowingRed.toggle()
                }
                
            }
            
            if isShowingRed {
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 200, height: 200)
                    //                    .transition(.scale)
                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
                
            }
        }
    }
}

struct HidingTransitions_Previews: PreviewProvider {
    static var previews: some View {
        HidingTransitions()
    }
}
