//
//  ContentView.swift
//  Day19Challenge
//
//  Created by Victor Rolando Sanchez Jara on 4/18/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    // MARK: Properties
    var temperatureUnitStrings = ["Celsius", "Fahrenheit", "Kelvin"]
    var temperatureUnits: [UnitTemperature] = [.celsius, .fahrenheit, .kelvin]
    @State private var selectedInput = 1
    @State private var inputValue = ""
    @State private var selectedOutput = 1

    // Constants
    let CELSIUS = 0
    let FAHRENHEIT = 1
    let KELVIN = 2
    
    var input: Measurement<UnitTemperature> {
        let doubleInput = Double(inputValue) ?? 0
        return Measurement(value: doubleInput, unit: temperatureUnits[selectedInput])
    }

    var output: Measurement<UnitTemperature> {
        return input.converted(to: temperatureUnits[selectedOutput])
    }
    
    // MARK: Body
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Select input unit")) {
                    Picker("Input Unit", selection: $selectedInput) {
                        ForEach(0 ..< temperatureUnitStrings.count) {
                            Text("\(self.temperatureUnitStrings[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Input in \(temperatureUnitStrings[selectedInput])")) {
                    TextField("Enter value", text: $inputValue)
                        .keyboardType(.decimalPad)
                }
                Section(header: Text("Select output unit")) {
                    Picker("Input Unit", selection: $selectedOutput) {
                        ForEach(0 ..< temperatureUnitStrings.count) {
                            Text("\(self.temperatureUnitStrings[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Output in \(temperatureUnitStrings[selectedOutput])")) {
                    Text("\(output.value, specifier: "%.2f")")
                }
            }
        .navigationBarTitle("Unit Converter")
        }
    }
    
    // MARK: Methods
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
