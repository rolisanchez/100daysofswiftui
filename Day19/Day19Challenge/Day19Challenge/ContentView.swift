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
    var temperatureUnits = ["Celsius", "Fahrenheit", "Kelvin"]
    @State private var selectedInput = 1
    @State private var inputValue = ""
    @State private var selectedOutput = 1

    // Constants
    let CELSIUS = 0
    let FAHRENHEIT = 1
    let KELVIN = 2
    
    var output: Double {
        let doubleInput = Double(inputValue) ?? 0
        
        switch selectedInput {
            case CELSIUS:
                switch selectedOutput {
                    case FAHRENHEIT:
                        return convertCelsiusToFahr(doubleInput)
                    case KELVIN:
                        return convertCelsiusToKelvin(doubleInput)
                    default:
                        return doubleInput
                }
            case FAHRENHEIT:
                switch selectedOutput {
                    case CELSIUS:
                        return convertFahrToCelsius(doubleInput)
                    case KELVIN:
                        return convertFahrToKelvin(doubleInput)
                    default:
                        return doubleInput
            }
            default:
                switch selectedOutput {
                    case CELSIUS:
                        return convertKelvinToCelsius(doubleInput)
                    case FAHRENHEIT:
                        return convertKelvinToFahr(doubleInput)
                    default:
                        return doubleInput
            }
            
        }
    }
    
    // MARK: Body
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Select input unit")) {
                    Picker("Input Unit", selection: $selectedInput) {
                        ForEach(0 ..< temperatureUnits.count) {
                            Text("\(self.temperatureUnits[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Input in \(temperatureUnits[selectedInput])")) {
                    TextField("Enter value", text: $inputValue)
                        .keyboardType(.decimalPad)
                }
                Section(header: Text("Select output unit")) {
                    Picker("Input Unit", selection: $selectedOutput) {
                        ForEach(0 ..< temperatureUnits.count) {
                            Text("\(self.temperatureUnits[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Output in \(temperatureUnits[selectedOutput])")) {
                    Text("\(output, specifier: "%.2f")")
                }
            }
        .navigationBarTitle("Unit Converter")
        }
    }
    
    // MARK: Methods
    func convertCelsiusToFahr (_ input: Double) -> Double {
        return (input * (9/5)) + 32
    }
    
    func convertCelsiusToKelvin(_ input: Double) -> Double {
        return input + 273.15
    }
    
    func convertKelvinToCelsius(_ input: Double) -> Double {
        return input - 273.15
    }
    
    func convertKelvinToFahr(_ input: Double) -> Double {
        return convertCelsiusToFahr(input - 273.15)
    }
    
    func convertFahrToCelsius (_ input: Double) -> Double {
        return (input - 32 ) * (9/5)
    }
    
    func convertFahrToKelvin (_ input: Double) -> Double {
        return convertFahrToCelsius(input) + 273.15
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
