//
//  HomeView.swift
//  OwnPost
//
//  Created by Rebecca Joseph on 11/15/24.
//

import Foundation
import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.posts) { post in
                PostCell(post: post)
            }
            .navigationTitle("OwnPost")
            .toolbar {
                Button(action: {
                    // Open new post creation view
                }) {
                    Image(systemName: "plus")
                }
            }
        }
        .onAppear {
            viewModel.fetchPosts()
        }
    }
}

struct PostCell: View {
    let post: Post
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(post.userProfileImage)
                    .resizable()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                Text(post.username)
                    .font(.headline)
            }
            Text(post.content)
            if let imageURL = post.imageURL {
                Image(imageURL)
                    .resizable()
                    .scaledToFit()
            }
            HStack {
                Button(action: {}) {
                    Image(systemName: "heart")
                    Text("\(post.likes)")
                }
                Button(action: {}) {
                    Image(systemName: "arrow.2.squarepath")
                    Text("\(post.reposts)")
                }
            }
        }
        .padding()
    }
}
