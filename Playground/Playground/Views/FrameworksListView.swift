//
//  ContentView.swift
//  Playground
//
//  Created by Kuba Rejmann on 11/11/2023.
//

import SwiftUI

struct FrameworksListView: View {
    @StateObject var viewModel = FrameworkListViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: viewModel.columns) {
                    ForEach(MockData.frameworks) { framework in
                        NavigationLink(value: framework){
                            FrameworkTitleView(framework: framework)
                        }
                    }
                }
            }
            .navigationTitle("Frameworks")
            .navigationDestination(for: Framework.self) { framework in
                    FrameworkDetailView(framework: framework)
            }
        }
       
    }
}

#Preview {
    FrameworksListView()
}

