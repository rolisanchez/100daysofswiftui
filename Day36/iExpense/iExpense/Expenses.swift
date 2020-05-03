//
//  Expenses.swift
//  iExpense
//
//  Created by Victor Rolando Sanchez Jara on 5/3/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI

class Expenses: ObservableObject {
    @Published var items: [ExpenseItem] {
        didSet {
            print("didSet")
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        print("init")
        if let items = UserDefaults.standard.data(forKey: "Items") {
            print("UserDefaults")
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([ExpenseItem].self, from: items) {
                self.items = decoded
                return
            }
        }
        
        self.items = []
    }
    
}
