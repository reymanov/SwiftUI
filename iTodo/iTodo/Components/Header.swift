//
//  Header.swift
//  ITodo
//
//  Created by Kuba Rejmann on 27/09/2023.
//

import SwiftUI

struct Header: View {
    let title: String
    let subtitle: String
    let angle: Double
    let background: Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(background)
                .rotationEffect(Angle(degrees: angle))
            
            VStack {
                Text(title)
                    .font(.system(size: 50))
                    .foregroundColor(Color.white)
                    .bold()
                
                Text(subtitle)
                    .font(.system(size: 30))
                    .foregroundColor(Color.white)
                    .bold()
            }
            .padding(.top, 80)
        }
        .frame(width: UIScreen.main.bounds.width * 3, height: 300)
        .position(x: UIScreen.main.bounds.width / 2, y: 50)
    }
}

#Preview {
    Header(title: "Title", subtitle: "Subtitle", angle: -15, background: Color.orange)
}
