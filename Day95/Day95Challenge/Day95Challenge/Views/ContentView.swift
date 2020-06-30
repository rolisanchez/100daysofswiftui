//
//  ContentView.swift
//  Day95Challenge
//
//  Created by Victor Rolando Sanchez Jara on 6/29/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    // MARK: Properties
    var settings = AppSettings()
    
    // MARK: Body
    var body: some View {
        TabView {
            DiceView()
                .tabItem {
                    Image(systemName: "number.square.fill")
                    Text("Dice Roll")
                }
            HistoryView()
                .tabItem {
                    Image(systemName: "book.fill")
                    Text("History")
            }
            SettingsView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }
            
        }
        .environmentObject(settings)
        .accentColor(Color.purple)
    }
    // MARK: Methods
}
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
