//
//  ContentView.swift
//  iExpense
//
//  Created by Ken Muyesu on 26/12/2021.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var expenses = Expenses()
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
    
    @State private var showingAddExpense = false
    
    var currencyFormatter: FloatingPointFormatStyle<Double>.Currency {
        return .currency(code: Locale.current.currencyCode ?? "USD")
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items) { item in
                    //Text(item.name)
                    HStack {
                        VStack (alignment: .leading)  {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        Spacer()
                        
                        Text(item.amount, format: currencyFormatter)
                            .expenseStyle(for: item)
                    }
                    
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
}

struct ExpenseStyle: ViewModifier {
    let expenseItem: ExpenseItem
    
    func body(content: Content) -> some View {
        switch expenseItem.amount {
        case 0..<10:
            content
                .foregroundColor(.green)
            
        case 10..<100:
            content
                .foregroundColor(.blue)
            
        default:
            content
                .font(.headline)
                .foregroundColor(.red)
        }
    }
}

extension View {
    func expenseStyle(for expenseItem: ExpenseItem) -> some View {
        modifier(ExpenseStyle(expenseItem: expenseItem))
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
