//
//  ContentView.swift
//  Day35Challenge
//
//  Created by Victor Rolando Sanchez Jara on 5/1/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var gameIsRunning = false
    @State private var maxLevel: Int = 1
    @State private var numberOfQuestions: Int = 10
    
    var body: some View {
        NavigationView {
            Group {
                if gameIsRunning {
                    GameView(maxLevel: $maxLevel, numberOfQuestions: $numberOfQuestions, gameIsRunning: $gameIsRunning)
                } else {
                    SettingsView(maxLevel: $maxLevel, gameIsRunning: $gameIsRunning, numberOfQuestions: $numberOfQuestions)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
