//
//  TapGestureDemo.swift
//  Flashzilla
//
//  Created by Victor Rolando Sanchez Jara on 6/21/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI

struct TapGestureDemo: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onTapGesture(count: 2) {
                print("Double tapped!")
            }
            // 1
//            .onLongPressGesture {
//                print("Long pressed!")
//            }
            // 2
//            .onLongPressGesture(minimumDuration: 2) {
//                print("Long pressed!")
//            }
        .onLongPressGesture(minimumDuration: 1, pressing: { inProgress in
            print("In progress: \(inProgress)!")
        }) {
            print("Long pressed!")
        }
    }
}

struct TapGestureDemo_Previews: PreviewProvider {
    static var previews: some View {
        TapGestureDemo()
    }
}
