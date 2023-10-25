//
//  RegisterView.swift
//  ToDoList
//
//  Created by MANAS G MUTALIKDESAI on 03/10/23.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewModel()
    
    var body: some View {
        VStack{
            HeaderView(title: "SMH!", subtitle: "Start doing better", angle: -15, bgClr: .pink)
            
            Form {
                TextField("Full Name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                
                TextField("Email", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    .autocorrectionDisabled()
                
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                
                ButtonD(title: "Register", bgClr: .orange){
                    viewModel.register()
                }
                .padding()
            }
            .offset(y: -50)

            Spacer()
            
            FooterView(tilt: -15, bgClr: .pink)
        }
    }
}

#Preview {
    RegisterView()
}
