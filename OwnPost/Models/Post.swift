//
//  Post.swift
//  OwnPost
//
//  Created by Rebecca Joseph on 11/15/24.
//

import Foundation
struct Post: Identifiable, Codable {
    let id: UUID
    let userID: UUID
    let content: String
    var imageURL: String?
    var likes: Int
    var reposts: Int
    let timestamp: Date
}
