//
//  SettingsView.swift
//  Day95Challenge
//
//  Created by Victor Rolando Sanchez Jara on 6/29/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    // MARK: Properties
    @EnvironmentObject var settings: AppSettings
    
    // MARK: Body
    var body: some View {
        // Binding for the Picker Index. Need to do this because binding directly to a string doesn't work
        let bindingDiceIndex = Binding<Int>(get: {
            DiceType.allCases.firstIndex(of: DiceType(rawValue: self.settings.chosenDice)!)!
        }, set: {
            self.settings.chosenDice = DiceType.allCases[$0].rawValue
        })
        
        return NavigationView {
            Form {
                Picker("Select your dice type", selection: bindingDiceIndex) {
                    ForEach(0..<DiceType.allCases.count) { index in
                        Text("\(DiceType.allCases[index].rawValue)")
                    }
                }
                
            }
            .navigationBarTitle("Settings")
        }
    }
    // MARK: Methods
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
