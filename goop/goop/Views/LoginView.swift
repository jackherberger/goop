//
//  LoginView.swift
//  goop
//
//  Created by Jack Herberger on 4/7/24.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                // Header
               HeaderView(title: "goop",
                          subtitle: "let's talk about real things.",
                          angle: 20,
                          background: .purple)
            
                
                // Login form
                Form {
                    if !viewModel.errMessage.isEmpty {
                        Text(viewModel.errMessage)
                            .foregroundColor(.red)
                    }
                    TextField("Email Address", text: $viewModel.email)
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    SecureField("Password", text: $viewModel.password)
                    
                    GButton(
                        title: "Log in",
                        background: .blue)
                                {
                                    viewModel.login()
                    }
                }
                .offset(y: -30)
                
                // Create account button
                VStack {
                    VStack {
                        Text("First time?")
                        NavigationLink("Create an account",
                                       destination: RegisterView())
                        
                    }
                    .padding(.bottom, 50)
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    LoginView()
}
