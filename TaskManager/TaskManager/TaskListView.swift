//
//  ContentView.swift
//  TaskManager
//
//  Created by Kuba Rejmann on 17/03/2023.
//

import SwiftUI

struct TaskListView: View {
    @ObservedObject var taskList = TaskList()
    @State var newTask: String = ""
    @State var isAdding = false
    
    var body: some View {
        List {
            ForEach(taskList.items) { item in
                Button(action: {
                    taskList.toggleItemCompleted(item: item)
                }) {
                    HStack {
                        Text(item.title)
                        Spacer()
                        Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "circle")
                    }
                }
                .foregroundColor(item.isCompleted ? .gray : .primary)
            }
            .onDelete(perform: taskList.removeItem)
        }
        .navigationTitle("Task Manager")
        .navigationBarItems(trailing:
                                Button(action: { isAdding = true }) {
            Image(systemName: "plus")
                .sheet(isPresented: $isAdding) {
                    AddTaskView
                }
            
        }
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TaskListView()
        }
    }
}
