//
//  TweetFileViewModel.swift
//  OwnPost
//
//  Created by Rebecca Joseph on 11/22/24.
//

import Foundation

enum TweetFilterViewModel: Int, CaseIterable{
    
    case tweets
    case replies
    case likes
    
    var title: String{
        switch self{
        case .tweets: return "Tweets"
        case .replies: return "Replies"
        case .likes: return "Likes"
        }
    }
}
