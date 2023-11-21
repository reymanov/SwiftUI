//
//  FrameworkDetailView.swift
//  Playground
//
//  Created by Kuba Rejmann on 11/11/2023.
//

import SwiftUI

struct FrameworkDetailView: View {
    var framework: Framework
    
    var body: some View {
        VStack {
            FrameworkTitleView(framework: framework)
            
            Text(framework.description)
                .padding()
                .font(.body)
            
            Spacer()
            
            Button {
                openURL(framework.urlString)
            } label: {
                    Label("Learn more", systemImage: "book")
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            
        }
    }
    
    private func openURL(_ urlString: String) {
        if let url = URL(string: urlString) {
            UIApplication.shared.open(url)
        }
    }

}

#Preview {
    FrameworkDetailView(framework: MockData.sampleFramework)
}
