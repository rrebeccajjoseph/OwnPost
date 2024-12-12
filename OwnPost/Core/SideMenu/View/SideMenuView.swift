//
//  SideMenuView.swift
//  OwnPost
//
//  Created by Rebecca Joseph on 11/22/24.
//

import SwiftUI

struct SideMenuView: View {
    @EnvironmentObject var AuthViewModel: AuthViewModel
    
    var body: some View {
        if let user = AuthViewModel.currentUser {
            VStack(alignment: .leading, spacing: 32) {
                VStack(alignment: .leading){
                    Circle()
                        .frame(width:48, height:48)
                    
                    VStack(alignment: .leading, spacing: 4){
                        Text(user.fullname)
                            .font(.headline)
                        
                        Text("@\(user.username)")
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                    }
                    
                    UserStatsView()
                        .padding(.vertical)
                }
                
                .padding(.leading)
                
                ForEach(SideMenuViewModel.allCases, id: \.self) { viewModel in
                    if viewModel == .profile{
                        NavigationLink{
                            ProfileView()
                        } label: {
                            SideMenuOptionRowView(viewModel: viewModel)
                        }
                    } else if viewModel == .logout{
                        Button{
                            AuthViewModel.signOut()
                        } label:{
                            SideMenuOptionRowView(viewModel:viewModel)

                        }
                        
                    } else{
                        SideMenuOptionRowView(viewModel:viewModel)

                    }
            
                }
                
                Spacer()
            
            }
            
        }
    }
    
}








#Preview {
    SideMenuView()
}

