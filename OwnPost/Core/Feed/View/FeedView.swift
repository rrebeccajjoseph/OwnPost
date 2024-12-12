//
//  FeedView.swift
//  OwnPost
//
//  Created by Rebecca Joseph on 11/20/24.
//

import SwiftUI

struct FeedView: View {
    @State private var showNewTweetFile = false
    var body: some View {
        
        ZStack(alignment: .bottomTrailing) {
            ScrollView{
                LazyVStack{
                    ForEach(0 ... 20, id: \.self) { _ in
                        TweetRowView()
                            .padding()
                        
                    }
                }
            }
            
            Button{
                showNewTweetFile.toggle()
            } label: {
                Image(systemName: "pencil")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 28, height: 28)
                    .padding()
            }
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .clipShape(Circle())
            .padding()
            .fullScreenCover(isPresented: $showNewTweetFile){
                NewTweetFile()
                
            }
        }
    }
    
    
    struct FeedView_Previews: PreviewProvider {
        static var previews: some View {
            FeedView()
        }
    }
    
}
