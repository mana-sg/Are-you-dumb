//
//  ProfileView.swift
//  ToDoList
//
//  Created by MANAS G MUTALIKDESAI on 03/10/23.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    
    var body: some View {
        NavigationView {
            VStack{
                if let user = viewModel.user {
                    profile(user: user)
                } else {
                    Text("Loading Profile..")
                }
                
            }
            .navigationTitle("This you?")
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
    @ViewBuilder
    func profile(user: User) -> some View {
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(Color.blue)
            .frame(width: 125, height: 125)
            .padding()
        
        VStack(alignment: .leading) {
            HStack {
                Text("Name: ")
                    .bold()
                Text(user.name)
            }
            .padding()
            HStack {
                Text("Email: ")
                    .bold()
                Text(user.email)
            }
            .padding()
            HStack {
                Text("Member Since: ")
                    .bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
            .padding()
        }
        .padding()
        
        Button("Log Out"){
            viewModel.logout()
        }
        .foregroundColor(Color.red)
        .padding()
        
        Spacer()
    }
}

#Preview {
    ProfileView()
}
