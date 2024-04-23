//
//  FeedView.swift
//  goop
//
//  Created by Jack Herberger on 4/7/24.
//

import SwiftUI
import FirebaseFirestoreSwift

struct FeedView: View {
    @StateObject var viewModel = FeedViewViewModel()
    @FirestoreQuery var items: [postItem]
    
    init(userId: String) {
        self._items = FirestoreQuery(
            collectionPath: "users/\(userId)/posts"
        )
    }
    
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) {item in
                    PostView(item: item)
                        .swipeActions {
                            Button ("Delete"){
                                viewModel.delete(id: item.id)
                            }
                            .tint(.red)
                            
                        }
                }
                .listStyle(PlainListStyle())
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
                NewPostView(newItemPresented:
                                $viewModel.showingNewPostView)
            }
        }
    }
}

#Preview {
    FeedView(userId: "J8YKRqMTZCW5JBYA0wDv7C2s4AX2")
}
