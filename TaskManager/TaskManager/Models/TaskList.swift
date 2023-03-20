//
//  TaskList.swift
//  TaskManager
//
//  Created by Kuba Rejmann on 17/03/2023.
//

import Foundation

class TaskList: ObservableObject {
    @Published var items: [Task] = []
    
    func addItem(title: String) {
        items.append(Task(title: title))
    }
    
    func removeItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func toggleItemCompleted(item: Task) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index].isCompleted.toggle()
        }
    }
}
