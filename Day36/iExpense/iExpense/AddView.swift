//
//  AddView.swift
//  iExpense
//
//  Created by Victor Rolando Sanchez Jara on 5/4/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI

struct AddView: View {
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = ""
    
    @ObservedObject var expenses: Expenses

    @Environment(\.presentationMode) var presentationMode

    static let types = ["Business", "Personal"]
    
    @State private var showingAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                Picker("Type", selection: $type) {
                    ForEach(Self.types, id: \.self) {
                        Text($0)
                    }
                }
                TextField("Amount", text: $amount)
                    .keyboardType(.numberPad)
            }
            .navigationBarTitle("Add new expense")
            .navigationBarItems(trailing: Button("Save") {
                if let actualAmount = Int(self.amount) {
                    let item = ExpenseItem(name: self.name, type: self.type, amount: actualAmount)
                    self.expenses.items.append(item)
                    // MARK: TODO: Delete after Xcode 11.5 fixes this bug below
                    self.expenses.items = self.expenses.items
                    self.presentationMode.wrappedValue.dismiss()
                } else {
                    self.alertTitle = "Error saving expense"
                    self.alertMessage = "Please enter a valid amount"
                    self.showingAlert.toggle()
                }
                
            })
            .alert(isPresented: $showingAlert) {
                Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("OK")){
                })
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
