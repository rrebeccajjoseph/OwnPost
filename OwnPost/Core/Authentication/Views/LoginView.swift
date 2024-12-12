//
//  LoginView.swift
//  OwnPost
//
//  Created by Rebecca Joseph on 11/26/24.
//

import SwiftUI


struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModels: AuthViewModel
    
    
    var body: some View {
        // parent container
        
        VStack{
            AuthHeaderView(title1: "Hello.", title2:"Welcome Back")
            
            
            VStack(spacing: 40) {
                CustomInputView(imageName: "envelope",
                                placeholderText: "Email",
                                text: $email)
                
                CustomInputView(imageName: "lock",
                                placeholderText: "Password",
                                isSecureField: true,
                                text: $password)
            }
            .padding(.horizontal, 32)
            .padding(.top, 44)
            
            HStack{
                Spacer()
                
                NavigationLink{
                    Text("Reset password view..")
                } label: {
                    Text("Forgot Password?")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(.systemBlue))
                        .padding(.top)
                        .padding(.trailing, 24)
                }
                
            }
            Button{
                viewModels.login(withEmail: email, password: password)
            } label: {
                Text("Sign In")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 340, height: 50)
                    .background(Color(.systemBlue))
                    .clipShape(Capsule())
                    .padding()
                
            }
            .shadow(color: .gray.opacity(0.5), radius: 10, x:0, y:0)
            
            Spacer()
            
            NavigationLink{
                Registration_View()
                    .navigationBarHidden(true)
                
            } label: {
                HStack{
                    Text("Don't have an account?")
                        .font(.footnote)
                    
                    Text("Sign up")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
            }
            .padding(.bottom, 32)
            .foregroundColor(Color(.systemBlue))
        }
        .ignoresSafeArea()
        .navigationBarHidden(true)
        
    }
}

#Preview {
    LoginView()
}
