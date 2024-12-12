//
//  OwnPostApp.swift
//  OwnPost
//
//  Created by Rebecca Joseph on 11/12/24.
//

import SwiftUI
import Firebase

@main
struct OwnPostApp: App {
    
    @StateObject var viewModels = AuthViewModel()
    
    init(){
        FirebaseApp.configure()
        
    }
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ContentView()
            }
            .environmentObject(viewModels)

        }
    }
}
