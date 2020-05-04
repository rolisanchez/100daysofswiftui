//
//  ContentView.swift
//  iExpense
//
//  Created by Victor Rolando Sanchez Jara on 5/2/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    // MARK: Properties
    @ObservedObject var expenses = Expenses()

    @State private var showingAddExpense = false

    // MARK: Body
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        
                        Spacer()
                        Text("$\(item.amount)")
                        .foregroundColor(item.amount > 10 ? .red : .green)
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationBarTitle("iExpense")
            .navigationBarItems(leading: EditButton(),
                trailing:
                Button(action: {
                    self.showingAddExpense = true
                }) {
                    Image(systemName: "plus")
                }
            )
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: self.expenses)
            }
        }
    }
    
    // MARK: Methods
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
        // MARK: TODO: Delete after Xcode 11.5 fixes this bug below
        expenses.items = expenses.items
    }}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
