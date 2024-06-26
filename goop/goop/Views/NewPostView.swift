//
//  NewPostView.swift
//  goop
//
//  Created by Jack Herberger on 4/7/24.
//

import SwiftUI


struct NewPostView: View {
    @StateObject var viewModel = NewPostViewViewModel()
    @Binding var newItemPresented: Bool 
    
    var body: some View {
        VStack {
            Text("New Blog Post")
                .font(.system(size: 32))
                .bold()
                .offset(y: 10
                )
            Form {
                // Title
                TextField("Title", text: $viewModel.title)

                // Subtitle
                TextField("Subtitle", text: $viewModel.subTitle)
                // Content
                TextField("What's on your mind",
                          text: $viewModel.text,
                          axis: .vertical)
                            .textFieldStyle(.roundedBorder)
                            .padding()
                
                // Post type button
                Toggle("Post anonymously", isOn: $viewModel.anon)
                
                // Done button
                GButton(title: "Post",
                        background: .purple) {
                    // Save post
                    if viewModel.canSave {
                        viewModel.save()
                        newItemPresented = false
                    } else {
                        viewModel.showAlert = true
                    }
                }
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("Error"),
                      message: Text("Please fill in all fields"))
            }
        }
    }
}

#Preview {
    NewPostView(newItemPresented: Binding(get: {
        return true
    }, set: {_ in
    }))
}
