//
//  GButton.swift
//  goop
//
//  Created by Jack Herberger on 4/14/24.
//

import SwiftUI

struct GButton: View {
    let title: String
    let background: Color
    let action: () -> Void
    
    var body: some View {
        Button {
        action()
        } label : {
            ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(background)
            
            Text(title)
                .foregroundColor(.white)
                .bold()
        }
            .padding()
    }
    }
}

#Preview {
    GButton(title: "Value",
            background: .pink)
    { 
        // action
    }
}
