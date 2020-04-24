//
//  ContentView.swift
//  BetterRest
//
//  Created by Victor Rolando Sanchez Jara on 4/24/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    // MARK: Properties
    @State private var sleepAmount = 8.0
    @State private var wakeUp = Date()

    // MARK: Body
    var body: some View {
        
        return Form {
            Section(header: Text("How much did you want to sleep?")) {
                Stepper(value: $sleepAmount, in: 4...12, step: 0.25) {
                    Text("\(sleepAmount, specifier: "%g") hours")
                }
            }
            Section(header: Text("When did you wake up?")) {
                DatePicker("Please enter a date", selection: $wakeUp, displayedComponents:  .hourAndMinute)
                    .labelsHidden()
            }
            
        }
        
    }
    
    // MARK: Methods
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
