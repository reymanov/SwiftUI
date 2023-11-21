//
//  ContentView.swift
//  ITodo
//
//  Created by Kuba Rejmann on 27/09/2023.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewModel()
    
    var body: some View {
        NavigationView {
            if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
                // Signed in
                TodoListView()
            }else {
                LoginView()
            }
        }
    }
}

#Preview {
    MainView()
}
