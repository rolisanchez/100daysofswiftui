//
//  GroupsTransparentLayoutDemo.swift
//  SnowSeeker
//
//  Created by Victor Rolando Sanchez Jara on 7/1/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI

struct GroupsTransparentLayoutDemo: View {
    @Environment(\.horizontalSizeClass) var sizeClass

    @State private var layoutVertically = false
    
    var body: some View {
        // Example 1
//        Group {
//            Text("Name: Paul")
//            Text("Country: England")
//            Text("Pets: Luna, Arya, and Toby")
//        }
        // Example 2
//        Group {
//            if layoutVertically {
//                VStack {
//                    UserView()
//                }
//            } else {
//                HStack {
//                    UserView()
//                }
//            }
//        }
//        .onTapGesture {
//            self.layoutVertically.toggle()
//        }
        // Example 3
        Group {
//            if sizeClass == .compact {
//                VStack {
//                    UserView()
//                }
//            } else {
//                HStack {
//                    UserView()
//                }
//            }
            // Init when only one view inside H or VStack
            if sizeClass == .compact {
                VStack(content: UserView.init)
            } else {
                HStack(content: UserView.init)
            }
        }
    }
}

struct GroupsTransparentLayoutDemo_Previews: PreviewProvider {
    static var previews: some View {
        GroupsTransparentLayoutDemo()
    }
}

struct UserView: View {
    var body: some View {
        Group {
            Text("Name: Paul")
            Text("Country: England")
            Text("Pets: Luna, Arya, and Toby")
        }
    }
}
