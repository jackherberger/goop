//
//  RegisterView.swift
//  goop
//
//  Created by Jack Herberger on 4/7/24.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        VStack {
        // Header
        HeaderView(title: "Sign up",
                   subtitle: "let's get you registered",
                   angle: 20.0,
                   background: .purple)
            Form{
                TextField("Full name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                
                TextField("Email address", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    .autocorrectionDisabled()
                
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                GButton(
                    title: "Create account",
                    background: .green,
                    action:
                            {
                                viewModel.register()
                })
            }
            .offset(y: -50)
            
        }
        Spacer()
        
    }
}

#Preview {
    RegisterView()
}
