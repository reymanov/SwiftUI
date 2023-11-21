//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Kuba Rejmann on 16/11/2023.
//

import SwiftUI

@main
struct BookwormApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            BookListView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
