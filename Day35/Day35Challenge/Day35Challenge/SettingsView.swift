//
//  SettingsView.swift
//  Day35Challenge
//
//  Created by Victor Rolando Sanchez Jara on 5/1/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    // MARK: Properties
    @Binding var maxLevel: Int
    @Binding var gameIsRunning: Bool
    @Binding var numberOfQuestions: Int
    @State var arrayIndex = 0
    
    var numberOptions = [2, 20, 30] // -1 is ALL
    var numberOptionsString = ["10", "20", "30", "All"] // -1 is ALL
    
    // MARK: Body
    var body: some View {
        Form {
            Section(header: Text("Select max level")) {
                Stepper(value: $maxLevel, in: 1...9, step: 1) {
                    Text("Max Level: \(maxLevel)")
                }
            }
            Section(header: Text("Select number of questions")) {
                Picker("Input Unit", selection: $arrayIndex) {
                    ForEach(0 ..< numberOptionsString.count) {
                        Text("\(self.numberOptionsString[$0])")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            Button(action: {
                if self.arrayIndex == 3 {
                    self.numberOfQuestions = 9 * self.maxLevel
                } else {
                    self.numberOfQuestions = self.numberOptions[self.arrayIndex]
                }
                self.gameIsRunning = true
            }) {
                Text("Start the game")
            }
        }
        .navigationBarTitle("Settings")
    }
    
    // MARK: Methods
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(maxLevel: .constant(3), gameIsRunning: .constant(false), numberOfQuestions: .constant(10))
    }
}
