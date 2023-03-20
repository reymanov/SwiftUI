//
//  TaskModel.swift
//  TaskManager
//
//  Created by Kuba Rejmann on 17/03/2023.
//

import Foundation

struct Task: Identifiable {
    let id = UUID()
    var title: String
    var isCompleted: Bool = false
}
