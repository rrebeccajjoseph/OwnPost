//
//  AuthViewModel.swift
//  OwnPost
//
//  Created by Rebecca Joseph on 12/7/24.
//

import SwiftUI
import Firebase
import FirebaseAuth

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var isLoading: Bool = false // Track loading state
    @Published var errorMessage: String? // Display error messages
    
    init() {
        self.userSession = Auth.auth().currentUser
        print("DEBUG: User session is \(String(describing: self.userSession))")
    }
    
    func login(withEmail email: String, password: String) {
        isLoading = true
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
            DispatchQueue.main.async {
                self?.isLoading = false
                if let error = error {
                    self?.errorMessage = "Failed to login: \(error.localizedDescription)"
                    print("DEBUG: \(self?.errorMessage ?? "")")
                    return
                }
                
                self?.userSession = result?.user
                print("DEBUG: Successfully logged in as \(String(describing: self?.userSession?.email))")
            }
        }
    }
    
    func register(withEmail email: String, password: String, fullname: String, username: String) {
        isLoading = true
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            DispatchQueue.main.async {
                self?.isLoading = false
                if let error = error {
                    self?.errorMessage = "Failed to register: \(error.localizedDescription)"
                    print("DEBUG: \(self?.errorMessage ?? "")")
                    return
                }
                
                guard let user = result?.user else { return }
                
                let data = ["email": email,
                            "username": username.lowercased(),
                            "fullname": fullname,
                            "uid": user.uid]
                
                Firestore.firestore().collection("users").document(user.uid).setData(data) { firestoreError in
                    if let firestoreError = firestoreError {
                        self?.errorMessage = "Failed to save user data: \(firestoreError.localizedDescription)"
                        print("DEBUG: \(self?.errorMessage ?? "")")
                        return
                    }
                    
                    // Update user session
                    self?.userSession = user
                    print("DEBUG: User registered and data saved \(data)")
                }
            }
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            userSession = nil
        } catch {
            print("DEBUG: Error signing out: \(error.localizedDescription)")
        }
    }
}
