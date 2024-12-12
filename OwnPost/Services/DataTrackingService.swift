//
//  DataTrackingService.swift
//  OwnPost
//
//  Created by Rebecca Joseph on 11/15/24.
//

import Foundation
class DataTrackingService {
    func trackInteraction(user: User, interactionType: InteractionType) {
        // Track user interactions
    }
    
    func trackActivity(user: User, activityType: ActivityType) {
        // Track user activities
    }
}

enum InteractionType {
    case like, repost, comment
}

enum ActivityType {
    case postCreated, profileViewed, searchPerformed
}
