//
//  ITodoApp.swift
//  ITodo
//
//  Created by Kuba Rejmann on 27/09/2023.
//
import FirebaseCore
import SwiftUI

@main
struct ITodoApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
