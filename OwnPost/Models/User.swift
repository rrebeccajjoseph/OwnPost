//
//  User.swift
//  OwnPost
//
//  Created by Rebecca Joseph on 11/15/24.
//

import Foundation
struct User: Codable {
    let id: UUID
    var username: String
    var profileImage: String?
    var demographicData: DemographicData
    var dataForSale: DataForSale
}

struct DemographicData: Codable {
    var age: Int?
    var gender: String?
    var location: String?
}

struct DataForSale: Codable {
    var isDemographicDataForSale: Bool = false
    var isInteractionDataForSale: Bool = false
    var isActivityDataForSale: Bool = false
}
