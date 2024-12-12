//
//  UserStatsView.swift
//  OwnPost
//
//  Created by Rebecca Joseph on 11/22/24.
//

import SwiftUI

struct UserStatsView: View {
    var body: some View {
        HStack(spacing: 24){
            HStack(spacing: 4){
                Text("887")
                    .font(.subheadline)
                    .bold()
                
                Text("following")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            HStack(spacing: 4){
                Text("6.9M")
                    .font(.subheadline)
                    .bold()
                
                Text("followers")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
    }
}

#Preview {
    UserStatsView()
}
