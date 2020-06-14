//
//  DemoTabView.swift
//  HotProspects
//
//  Created by Victor Rolando Sanchez Jara on 6/14/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI

struct DemoTabView: View {
    @State private var selectedTab = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            Text("Tab 1")
                .onTapGesture {
                    self.selectedTab = 1
                }
                .tabItem {
                    Image(systemName: "star")
                    Text("One")
                }
                .tag(0)
            Text("Tab 2")
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("Two")
                }
                .tag(1)
        }
    }
}

struct DemoTabView_Previews: PreviewProvider {
    static var previews: some View {
        DemoTabView()
    }
}
