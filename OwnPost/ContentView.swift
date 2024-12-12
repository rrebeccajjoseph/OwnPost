//
//  ContentView.swift
//  OwnPost
//
//  Created by Rebecca Joseph on 11/12/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showMenu = false
    @EnvironmentObject var viewModels: AuthViewModel
    
    var body: some View {
        Group{
            if viewModels.userSession == nil{
                LoginView()
    
            }else{
                mainInterfaceView
            }
        }
    }
}
    

extension ContentView{
    var mainInterfaceView: some View{
        ZStack(alignment: .topLeading) {
            MainTabView()
                .navigationBarHidden(showMenu)
            
            if showMenu {
                ZStack {
                    Color(.black)
                        .opacity(showMenu ? 0.25 : 0.0)
                }
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        showMenu = false
                    }
                }
                .ignoresSafeArea()
            }
            
            SideMenuView()
                .frame(width: UIScreen.main.bounds.width * 0.7)
                .offset(x: showMenu ? 0 : -UIScreen.main.bounds.width, y: 0)
                .background(showMenu ? Color.white : Color.clear)
        }
        .navigationTitle("Home")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    withAnimation(.easeInOut) {
                        showMenu.toggle()
                    }
                } label: {
                    Circle()
                        .frame(width: 32, height: 32)
                }
            }

            }
        .onAppear{
            showMenu = false
        }
    }
}



    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AuthViewModel())
        
        
    }
    
}


