//
//  ContentView.swift
//  Animations
//
//  Created by Kuba Rejmann on 15/11/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var dragAmount = CGSize.zero
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .frame(width: 300, height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .offset(dragAmount)
            .gesture(
                DragGesture()
                    .onChanged { dragAmount = $0.translation }
                    .onEnded {_ in dragAmount = .zero }
            )
            .animation(.spring(), value: dragAmount)
    }
}

#Preview {
    ContentView()
}
