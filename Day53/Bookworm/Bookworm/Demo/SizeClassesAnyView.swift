//
//  SizeClassesAnyView.swift
//  Bookworm
//
//  Created by Victor Rolando Sanchez Jara on 5/18/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI

struct SizeClassesAnyView: View {
    @Environment(\.horizontalSizeClass) var sizeClass

    var body: some View {
        // Using HStack
//        if sizeClass == .compact {
//            return HStack {
//                Text("Active size class:")
//                Text("COMPACT")
//            }
//            .font(.largeTitle)
//        } else {
//            return HStack {
//                Text("Active size class:")
//                Text("REGULAR")
//            }
//            .font(.largeTitle)
//        }
        
        // Using AnyView
        if sizeClass == .compact {
            return AnyView(VStack {
                Text("Active size class:")
                Text("COMPACT")
            }
            .font(.largeTitle))
        } else {
            return AnyView(HStack {
                Text("Active size class:")
                Text("REGULAR")
            }
            .font(.largeTitle))
        }
    }
}

struct SizeClassesAnyView_Previews: PreviewProvider {
    static var previews: some View {
        SizeClassesAnyView()
//            .previewDevice("iPad Pro (9.7-inch)")
    }
}

// Dismissing

// @Environment(\.presentationMode) var presentationMode
//Text("Hello World")
//    .onTapGesture {
//        self.presentationMode.wrappedValue.dismiss()
//}
