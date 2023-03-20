//
//  AddView.swift
//  iExpense
//
//  Created by Kuba Rejmann on 20/03/2023.
//

import SwiftUI

struct AddView: View {
    @ObservedObject var expenses: Expenses
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    
    let types = ["Business", "Personal"]
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
               
                TextField("Amount", value: $amount, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("New expense")
            .toolbar {
                Button("Save") {
                    let newExpense = ExpenseItem(name: name, type: type, amount: amount)
                    expenses.items.append(newExpense)
                    dismiss()
                }
                .disabled(name.isEmpty || amount.isZero)
                
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
