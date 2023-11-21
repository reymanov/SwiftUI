//
//  MockData.swift
//  ExpenseTracker
//
//  Created by Kuba Rejmann on 30/07/2023.
//

import Foundation
import Algorithms

struct Expense: Hashable, Identifiable {
    let id = UUID()
    let date: Date
    let title: String
    let value: Double
}

struct MockData {
    static let calendar = Calendar.current
    
    static let expenses: [Expense] = {
        var mockExpenses = [Expense]()
        
        // Function to generate a random date within the current year
        func randomDateWithinThisYear() -> Date {
            let currentDate = Date()
            let startOfYear = calendar.date(from: calendar.dateComponents([.year], from: currentDate))!
            let endOfYear = calendar.date(byAdding: DateComponents(year: 1, second: -1), to: startOfYear)!
            let randomTimeInterval = TimeInterval.random(in: startOfYear.timeIntervalSince1970...endOfYear.timeIntervalSince1970)
            return Date(timeIntervalSince1970: randomTimeInterval)
        }
        
        // Function to generate a random title for the expense
        func randomTitle() -> String {
            let titles = ["Groceries", "Transportation", "Entertainment", "Utilities", "Dining out", "Shopping", "Healthcare"]
            return titles.randomElement()!
        }
        
        // Function to generate a random value for the expense between 1 and 100
        func randomValue() -> Double {
            return Double.random(in: 1...100)
        }
        
        for _ in 1...10 {
            let expense = Expense(date: randomDateWithinThisYear(), title: randomTitle(), value: randomValue())
            mockExpenses.append(expense)
        }
        
        return mockExpenses
    }()
    
    static var chunkedExpenses: [[Expense]] {
        let sortedExpenses = MockData.expenses.sorted(by: { $0.date < $1.date })
        let chunkedExpenses = sortedExpenses.chunked { calendar.isDate($0.date, equalTo: $1.date, toGranularity: .month) }
        return chunkedExpenses.map { Array($0) }
    }
}
