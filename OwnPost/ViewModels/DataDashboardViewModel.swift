//
//  DataDashboardViewModel.swift
//  OwnPost
//
//  Created by Rebecca Joseph on 11/15/24.
//

import Foundation
class DataDashboardViewModel: ObservableObject {
    @Published var user: User
    @Published var dataProfits: [DataType: Double] = [:]
    
    init(user: User) {
        self.user = user
    }
    
    func updateProfits() {
        // Fetch and update data selling profits
    }
}
