//
//  UserService.swift
//  OwnPost
//
//  Created by Rebecca Joseph on 11/15/24.
//

import Foundation
class UserService {
    func updateDataForSale(user: User, dataType: DataType, isForSale: Bool) {
        // Update user's data sale preferences
    }
    
    func sellUserData(user: User, dataType: DataType) -> Double {
        // Simulate selling user data and return profit
    }
}

enum DataType {
    case demographic, interaction, activity
}
