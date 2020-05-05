//
//  NavigationLinkView.swift
//  Mooonshot
//
//  Created by Victor Rolando Sanchez Jara on 5/5/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI

struct NavigationLinkView: View {
    var body: some View {
//        NavigationView {
//            VStack {
//                NavigationLink(destination: Text("Detail View")) {
//                    Text("Hello World")
//                }
//            }
//            .navigationBarTitle("SwiftUI")
//        }
        
        NavigationView {
            List(0..<100) { row in
                NavigationLink(destination: Text("Detail \(row)")) {
                    Text("Row \(row)")
                }
            }
            .navigationBarTitle("SwiftUI")
        }
    }
}

struct NavigationLinkView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationLinkView()
    }
}
