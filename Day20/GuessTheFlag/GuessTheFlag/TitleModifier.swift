//
//  TitleModifier.swift
//  GuessTheFlag
//
//  Created by Victor Rolando Sanchez Jara on 4/22/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            
    }
}

extension View {
    func titleStyle() -> some View {
        self.modifier(Title())
    }
}
