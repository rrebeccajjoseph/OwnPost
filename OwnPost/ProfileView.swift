//
//  ProfileView.swift
//  OwnPost
//
//  Created by Rebecca Joseph on 11/15/24.
//

import Foundation
import SwiftUI

struct ProfileView: View {
    @StateObject private var viewModel: ProfileViewModel
    
    init(user: User) {
        _viewModel = StateObject(wrappedValue: ProfileViewModel(user: user))
    }
    
    var body: some View {
        VStack {
            Image(viewModel.user.profileImage ?? "default_profile")
                .resizable()
                .frame(width: 100, height: 100)
                .clipShape(Circle())
            
            Text(viewModel.user.username)
                .font(.title)
            
            Form {
                Section(header: Text("Data for Sale")) {
                    Toggle("Demographic Data", isOn: $viewModel.user.dataForSale.isDemographicDataForSale)
                    Toggle("Interaction Data", isOn: $viewModel.user.dataForSale.isInteractionDataForSale)
                    Toggle("Activity Data", isOn: $viewModel.user.dataForSale.isActivityDataForSale)
                }
            }
            
            NavigationLink(destination: DataDashboardView(user: viewModel.user)) {
                Text("View Data Dashboard")
            }
        }
        .navigationTitle("Profile")
    }
}
