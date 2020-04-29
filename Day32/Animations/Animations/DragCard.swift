//
//  DragCard.swift
//  Animations
//
//  Created by Victor Rolando Sanchez Jara on 4/29/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI

struct DragCard: View {
    @State private var dragAmount = CGSize.zero
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .frame(width: 300, height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .offset(dragAmount)
            .gesture(
                DragGesture()
                    .onChanged { self.dragAmount = $0.translation }
                    .onEnded { _ in withAnimation(.spring()) {
                        self.dragAmount = .zero
                        }
                }
        )
            .animation(.spring())
        
    }
}

struct DragCard_Previews: PreviewProvider {
    static var previews: some View {
        DragCard()
    }
}
