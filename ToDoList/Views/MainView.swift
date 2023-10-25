//
//  MainView.swift
//  ToDoList
//
//  Created by MANAS G MUTALIKDESAI on 03/10/23.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewModel()
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUSerId.isEmpty {
            accountView
        }
        else{
            LogInView()
        }
    }
    
    @ViewBuilder
    var accountView: some View {
        TabView {
            ItemsView(userId: viewModel.currentUSerId)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
        }
    }
}

#Preview {
    MainView()
}
