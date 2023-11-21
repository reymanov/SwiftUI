//
//  PlaygroundView.swift
//  Bookworm
//
//  Created by Kuba Rejmann on 16/11/2023.
//

import SwiftUI

struct PlaygroundView: View {
    var body: some View {
        Text("7 / 10")
            .foregroundColor(.secondary)
            .font(.caption)
        
        Image(systemName: "7.circle")
    }
}

#Preview {
    PlaygroundView()
}
