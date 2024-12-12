//
//  User.swift
//  OwnPost
//
//  Created by Rebecca Joseph on 12/11/24.
//

import FirebaseFirestoreCombineSwift
import FirebaseFirestore

struct User: Identifiable, Decodable{
    @DocumentID var id: String?
    let username: String
    let fullname: String
    let profileImageUrl: String
    let email: String
}
