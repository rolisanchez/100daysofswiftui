//
//  ContentView.swift
//  WeSplit
//
//  Created by Victor Rolando Sanchez Jara on 4/15/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = ""
    @State private var tipPercentage = 2
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var peopleCount: Double {
        return Double(numberOfPeople) ?? 0
    }
    
    var totalPerPerson: Double {
        let totalPerPerson = (totalWithTip / peopleCount)
        return totalPerPerson.isNaN ? 0 : totalPerPerson
    }
    
    var totalWithTip: Double {
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount * (tipSelection / 100)
        let grandTotal = orderAmount + tipValue
        
        return grandTotal
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                    .keyboardType(.decimalPad)
                    // Change the “Number of people” picker to be a text field, making sure to use the correct keyboard type.
                    TextField("Number of people", text: $numberOfPeople)
                        .keyboardType(.numberPad)
                }
                Section(header: Text("How much tip do you want to leave?")) {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())

                }
                Section(header: Text("Total Amount + Tip")) {
                    Text("$\(totalWithTip, specifier: "%.2f")")
                        .foregroundColor(tipPercentage == 4 ? .red : .black)
                }
                Section(header: Text("Amount per Person")) {
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
            }
            .navigationBarTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
