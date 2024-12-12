//
//  UserInteractions.swift
//  OwnPost
//
//  Created by Rebecca Joseph on 12/11/24.
//

import Foundation

class InteractionModel: ObservableObject {
    @Published var likes: Int = 0
    @Published var shares: Int = 0
    @Published var follows: Int = 0
    
    func like() {
        likes += 1
    }
    
    func share() {
        shares += 1
    }
    
    func follow() {
        follows += 1
    }
}
