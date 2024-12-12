//
//  UserService.swift
//  OwnPost
//
//  Created by Rebecca Joseph on 12/11/24.
//

import Firebase
import FirebaseAuth
import FirebaseFirestoreCombineSwift
import FirebaseFirestore

struct UserService{
    func fetchUser(withUid uid: String, completion: @escaping(User) -> Void){
        Firestore.firestore().collection("users")
            .document(uid)
            .getDocument { snapshot, _ in
                guard let snapshot = snapshot else {return}
                
                guard let user = try? snapshot.data(as: User.self) else {return}
                completion(user)
            }
    }
}
