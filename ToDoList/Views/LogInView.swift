//
//  LogInView.swift
//  ToDoList
//
//  Created by MANAS G MUTALIKDESAI on 03/10/23.
//

import SwiftUI

struct LogInView: View {
    @StateObject var viewModel = LogInViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
                //Header
                HeaderView(title: "Are you dumb?", subtitle: "Just remember it", angle: 15, bgClr: .purple)
                
                //Login
                Form {
                    
                    if !viewModel.errorMes.isEmpty {
                        Text(viewModel.errorMes)
                            .foregroundColor(Color.red)
                    }
                    
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                    
                    ButtonD(title: "Log In", bgClr: .blue){
                        viewModel.login()
                    }
                    .padding()
                }
                
                
                //Create Account
                VStack{
                    Text("Don't have one yet?")
                    NavigationLink("Create An Account", destination: RegisterView())
                }
                
                
                Spacer()
                
                FooterView(tilt: 15, bgClr: .purple)
            }
        }
    }
}

#Preview {
    LogInView()
}
