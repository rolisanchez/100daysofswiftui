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
    
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount: Int = 1
    
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    // MARK: Body
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("When do you want to wake up?")) {
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                        .datePickerStyle(WheelDatePickerStyle())
                }

                Section(header: Text("Desired amount of sleep")) {
                    Stepper(value: $sleepAmount, in: 4...12, step: 0.25) {
                        Text("\(sleepAmount, specifier: "%g") hours")
                    }
                    .accessibility(value: Text("\(sleepAmount) hours"))
                }
               
                
                Section(header: Text("Daily coffee intake")) {
                    Picker("Tip percentage", selection: $coffeeAmount) {
                        ForEach(0 ..< 21) { amount in
                            Text("\(amount) cup\(amount == 1 ? "" : "s")")
                        }
                    }
                }
                
                Text("Recommended sleep time: \(recommendedSleepTime)")
                    .font(.title)
            }
            .navigationBarTitle("BetterRest")
        }
    }
    // MARK: Computed Properties

    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date()
    }
    
     var recommendedSleepTime: String {
        var recommendation = ""
        let model = SleepCalculator()
        
        let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
        let hour = (components.hour ?? 0) * 60 * 60
        let minute = (components.minute ?? 0) * 60
        
        do {
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
            
            let formatter = DateFormatter()
            formatter.timeStyle = .short
            
            recommendation = formatter.string(from: sleepTime)
        } catch {
            recommendation = "Error"
        }
        
        return recommendation
    }
    
    // MARK: Methods

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
