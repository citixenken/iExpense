//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Ken Muyesu on 29/12/2021.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
