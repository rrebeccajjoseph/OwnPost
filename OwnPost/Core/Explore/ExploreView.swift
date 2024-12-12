//
//  ExploreView.swift
//  OwnPost
//
//  Created by Rebecca Joseph on 11/21/24.
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
        NavigationView{
            VStack{
                ScrollView {
                    LazyVStack{
                        ForEach(0...25, id: \.self) {_ in
                            NavigationLink{
                                ProfileView()
                            } label:{
                                UserRowView()
                            }
                            
                        }
                    }
                }
            }
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ExploreView()
}
