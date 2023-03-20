//
//  TaskManagerApp.swift
//  TaskManager
//
//  Created by Kuba Rejmann on 17/03/2023.
//

import SwiftUI

@main
struct TaskManagerApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                TaskListView()
            }
        }
    }
}
