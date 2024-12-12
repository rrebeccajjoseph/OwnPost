//
//  TweetRowView.swift
//  OwnPost
//
//  Created by Rebecca Joseph on 11/20/24.
//

import SwiftUI

struct TweetRowView: View {
    var body: some View {
        // parent container is a VStack because on Twitter we have things vertically stacked on eachoter
        VStack(alignment: .leading){
            
            // profile image + user info + tweet
            HStack(alignment: .top, spacing: 12){
                Circle()
                    .frame(width: 56, height: 56)
                    .foregroundColor(Color(.systemBlue))
              
                // user infor & tweet caption
                VStack(alignment: .leading, spacing:4){
        
                    //user info
                    HStack{
                        Text("Lowry Pressly")
                            .font(.subheadline).bold()
                    
                        Text("@Rebecca")
                        .foregroundColor(.gray)
                            .font(.caption)
                             
                        Text("2w")
                            .foregroundColor(.gray)
                            .font(.caption)
                    }
                             
                    //tweet caption
                    Text("I believe in Harvey Dent.")
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                        
                             
                    
                }
            }
            
            //action buttons
            
            HStack{
                Button(action: {
                    //action goes here
                    
                }, label: {
                    Image(systemName: "bubble.left")
                        .font(.subheadline)
                })
                
                Spacer()
                
                Button(action: {
                    //action goes here
                    
                }, label: {
                    Image(systemName: "arrow.2.squarepath")
                        .font(.subheadline)
                })
                
                Spacer()
                
                Button(action: {
                    //action goes here
                    
                }, label: {
                    Image(systemName: "heart")
                        .font(.subheadline)
                })
                
                Spacer()
                
                Button(action: {
                    //action goes here
                    
                }, label: {
                    Image(systemName: "bookmark")
                        .font(.subheadline)
                })
            }
            .padding()
            .foregroundColor(.gray)
            Divider()
        }
    }
}

#Preview {
    TweetRowView()
}
