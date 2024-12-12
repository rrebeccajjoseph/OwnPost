//
//  Registration View.swift
//  OwnPost
//
//  Created by Rebecca Joseph on 11/26/24.
//

import SwiftUI

struct Registration_View: View {
    @State private var email = ""
    @State private var username = ""
    @State private var fullname = ""
    @State private var password = ""
    @Environment(\.presentationMode) var pre
    @EnvironmentObject var viewModels: AuthViewModel

    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack{
            


            AuthHeaderView(title1: "Get Started.", title2:"Create Your Account")
            
            VStack(spacing: 40){
                CustomInputView(imageName: "envelope",
                                placeholderText: "Email",
                                text: $email)
                
                CustomInputView(imageName: "person",
                                placeholderText: "Username",
                                text: $username)
                
                CustomInputView(imageName: "person",
                                placeholderText: "Full Name",
                                text: $fullname)
                
                CustomInputView(imageName: "lock",
                                placeholderText: "Password",
                                isSecureField: true,
                                text: $password)
            }
            .padding(32)
            
            Button{
                viewModels.register(withEmail: email,
                                   password: password,
                                   fullname: fullname,
                                   username: username)
            } label: {
                Text("Sign Up")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 340, height: 50)
                    .background(Color(.systemBlue))
                    .clipShape(Capsule())
                    .padding()
                
            }
            .shadow(color: .gray.opacity(0.5), radius: 10, x:0, y:0)
            
            Spacer()
            
            Button{
                presentationMode.wrappedValue.dismiss()
            } label:{
                HStack{
                    Text("Don't have an account?")
                        .font(.footnote)
                    
                    Text("Sign up")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
            }
            .padding(.bottom, 32)
        }
        .ignoresSafeArea()
        .navigationBarHidden(true)
    }
}
    

    struct RegistrationView_Previews: PreviewProvider{
        static var previews: some View{
            Registration_View()
        }
    }

