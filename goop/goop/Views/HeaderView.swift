//
//  HeaderView.swift
//  goop
//
//  Created by Jack Herberger on 4/8/24.
//

import SwiftUI

struct HeaderView: View {
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
                    .font(.system(size: 20))
                    .foregroundColor(Color.white)
            }
            .padding(.top, 110)
        }
        .frame(width: UIScreen.main.bounds.width * 3, height: 350)
        .offset(y:-150)
    }
}

#Preview {
    HeaderView(title: "title",
               subtitle: "subtitle",
               angle: 0,
               background: .blue)
}
