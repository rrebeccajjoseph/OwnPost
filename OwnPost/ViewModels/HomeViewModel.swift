//
//  HomeViewModel.swift
//  OwnPost
//
//  Created by Rebecca Joseph on 11/15/24.
//

import Foundation
class HomeViewModel: ObservableObject {
    @Published var posts: [Post] = []
    private let postService = PostService()
    
    func fetchPosts() {
        posts = postService.getFeed()
    }
}
