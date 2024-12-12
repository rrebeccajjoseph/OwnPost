//
//  ProfilePhotoSelectorView.swift
//  OwnPost
//
//  Created by Rebecca Joseph on 12/11/24.
//

import SwiftUI
import PhotosUI

struct ProfilePhotoSelectorView: View {
    @State private var selectedImage: UIImage? = nil
    @State private var isPickerPresented: Bool = false
    @State private var photoItem: PhotosPickerItem? = nil
    
    var body: some View {
        VStack {
            AuthHeaderView(title1: "Create your account",
                           title2: "Add a profile photo")
            
            if let selectedImage = selectedImage {
                Image(uiImage: selectedImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 180, height: 180)
                    .clipShape(Circle())
                    .padding(.top, 44)
            } else {
                Button {
                    isPickerPresented.toggle()
                } label: {
                    Image("plus_photo")
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(Color(.systemBlue))
                        .scaledToFill()
                        .frame(width: 180, height: 180)
                        .padding(.top, 44)
                }
            }
            
            Spacer()
        }
        .photosPicker(isPresented: $isPickerPresented,
                      selection: $photoItem,
                      matching: .images)
        .onChange(of: photoItem) {
            if let photoItem {
                Task {
                    if let data = try? await photoItem.loadTransferable(type: Data.self),
                       let image = UIImage(data: data) {
                        selectedImage = image
                    }
                }
            }
        }
        .ignoresSafeArea()
    }
}
