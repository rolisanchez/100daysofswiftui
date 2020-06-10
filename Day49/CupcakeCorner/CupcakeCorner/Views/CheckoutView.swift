//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Victor Rolando Sanchez Jara on 5/15/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI

struct CheckoutView: View {
    // MARK: Properties
    // Old Class
    //    @ObservedObject var order = Order()
    // New wrapper around struct
    @ObservedObject var wrapper = OrderWrapper()
    
    @State private var confirmationTitle = ""
    @State private var confirmationMessage = ""
    @State private var showingConfirmation = false
    
    // MARK: Body
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                VStack {
                    Image("cupcakes")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width)
                        .accessibility(hidden: true)
                    Text("Your total is $\(self.wrapper.order.cost, specifier: "%.2f")")
                        .font(.title)
                    
                    Button("Place Order") {
                        self.placeOrder()
                    }
                    .padding()
                }
            }
        }
        .navigationBarTitle("Check out", displayMode: .inline)
        .alert(isPresented: $showingConfirmation) {
            Alert(title: Text(confirmationTitle), message: Text(confirmationMessage), dismissButton: .default(Text("OK")))
        }
    }
    
     // MARK: Methods
    func placeOrder() {
        guard let encoded = try? JSONEncoder().encode(wrapper.order) else {
            print("Failed to encode order")
            return
        }
        
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = encoded
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print("No data in response: \(error?.localizedDescription ?? "Unknown error").")
                if let error = error {
                    // If we want to use NSError
//                    let nsError = error as NSError
//                    if nsError.code == 1 {}
                    // Using Swift's Error:
                    if error._code == NSURLErrorNotConnectedToInternet {
                        self.confirmationTitle = "Error"
                        self.confirmationMessage = "It seems that you are not connected to the Internet."
                        self.showingConfirmation = true
                    }
                }
                
                return
            }
            
            
            
            if let decodedOrder = try? JSONDecoder().decode(Order.self, from: data) {
                self.confirmationTitle = "Thank you!"
                self.confirmationMessage = "Your order for \(decodedOrder.quantity)x \(Order.types[decodedOrder.type].lowercased()) cupcakes is on its way!"
                self.showingConfirmation = true
            } else {
                print("Invalid response from server")
            }
        }.resume()

    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(wrapper: OrderWrapper())
    }
}
