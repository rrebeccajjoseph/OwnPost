//
//  ProfileViewModel.swift
//  OwnPost
//
//  Created by Rebecca Joseph on 11/15/24.
//

import Foundation
class ProfileViewModel: ObservableObject {
    @Published var user: User
    private let userService = UserService()
    
    init(user: User) {
        self.user = user
    }
    
    func updateDataForSale(dataType: DataType, isForSale: Bool) {
        userService.updateDataForSale(user: user, dataType: dataType, isForSale: isForSale)
    }
    
    func sellData(dataType: DataType) -> Double {
        return userService.sellUserData(user: user, dataType: dataType)
    }
}
