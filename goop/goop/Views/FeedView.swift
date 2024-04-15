//
//  FeedView.swift
//  goop
//
//  Created by Jack Herberger on 4/7/24.
//

import SwiftUI

struct FeedView: View {
    @StateObject var viewModel = FeedViewViewModel()
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    
    var body: some View {
        NavigationView {
            VStack {
            }
            .navigationTitle("Feed")
            .toolbar{
                Button {
                    // Action
                    viewModel.showingNewPostView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewPostView ) {
                NewPostView()
            }
        }
    }
}

#Preview {
    FeedView(userId: "")
}
