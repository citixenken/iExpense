//
//  Expenses.swift
//  iExpense
//
//  Created by Ken Muyesu on 29/12/2021.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]()
}


