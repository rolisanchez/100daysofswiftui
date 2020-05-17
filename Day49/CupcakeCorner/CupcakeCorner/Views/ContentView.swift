//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Victor Rolando Sanchez Jara on 5/14/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    // MARK: Properties
    // Old Class
//    @ObservedObject var order = Order()
    // New wrapper around struct
    @ObservedObject var wrapper = OrderWrapper()

    // MARK: Body
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select your cake type", selection: $wrapper.order.type) {
                        ForEach(0..<Order.types.count) {
                            Text(Order.types[$0])
                        }
                    }
                    
                    Stepper(value: $wrapper.order.quantity, in: 3...20) {
                        Text("Number of cakes: \(wrapper.order.quantity)")
                    }
                }
                Section {
                    Toggle(isOn: $wrapper.order.specialRequestEnabled.animation()) {
                        Text("Any special requests?")
                    }
                    
                    if wrapper.order.specialRequestEnabled {
                        Toggle(isOn: $wrapper.order.extraFrosting) {
                            Text("Add extra frosting")
                        }
                        
                        Toggle(isOn: $wrapper.order.addSprinkles) {
                            Text("Add extra sprinkles")
                        }
                    }
                }
                Section {
                    NavigationLink(destination: AddressView(wrapper: wrapper)) {
                        Text("Delivery details")
                    }
                }
            }
            .navigationBarTitle("Cupcake Corner")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
