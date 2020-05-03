//
//  Expenses.swift
//  iExpense
//
//  Created by Victor Rolando Sanchez Jara on 5/3/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import Combine

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]()
}
