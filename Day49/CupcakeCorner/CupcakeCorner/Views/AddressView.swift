//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Victor Rolando Sanchez Jara on 5/15/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI

struct AddressView: View {
    // MARK: Properties
    // Old Class
    //    @ObservedObject var order = Order()
    // New wrapper around struct
    @ObservedObject var wrapper = OrderWrapper()
    
    // MARK: Body
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $wrapper.order.name)
                TextField("Street Address", text: $wrapper.order.streetAddress)
                TextField("City", text: $wrapper.order.city)
                TextField("Zip", text: $wrapper.order.zip)
            }
            
            Section {
                NavigationLink(destination: CheckoutView(wrapper: wrapper)) {
                    Text("Check out")
                }
            }
            .disabled(wrapper.order.hasValidAddress == false)
        }
        .navigationBarTitle("Delivery details", displayMode: .inline)
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView(wrapper: OrderWrapper())
    }
}
