//
//  PostView.swift
//  goop
//
//  Created by Jack Herberger on 4/7/24.
//

import SwiftUI

struct PostView: View {
    @StateObject var viewModel = PostViewViewModel()
    
    let item: postItem
    
    var body: some View {
        HStack {
            VStack (alignment: .leading){
                Text(item.title)
                    .bold()
                    .font(.title)
                Text(item.subTitle)
                Text(item.text)
                    .font(.subheadline)
                Text("\(Date(timeIntervalSince1970: item.postDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote )
                    .foregroundColor(Color(.secondaryLabel))
            
            }
            
            Spacer()
            
            Button {
                viewModel.toggleLiked()
            } label: {
                Image(systemName: item.isDone ? "heart.fill" : "heart")
            }
        }
    }
}

#Preview {
    PostView(item: .init(id: "123",
                         title: "My post",
                         subTitle: "My first blog",
                         postDate: Date().timeIntervalSince1970,
                         anon: false,
                         text: "Hello, World!",
                         isDone: false))
}
