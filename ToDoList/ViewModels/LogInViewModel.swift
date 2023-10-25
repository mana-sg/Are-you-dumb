//
//  LogInViewModel.swift
//  ToDoList
//
//  Created by MANAS G MUTALIKDESAI on 03/10/23.
//

import Foundation
import FirebaseAuth


class LogInViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMes = ""
    
    init() {}

    func login() {
        guard validate() else{
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password)
        
    }

    
    private func validate() -> Bool {
        guard !email.isEmpty, !password.isEmpty,
                !password.trimmingCharacters(in: .whitespaces).isEmpty else{
            
            errorMes = "Fill in all the fields!"
            
            return false
        }
        
        guard email.contains("@") && email.contains(".") else{
            errorMes = "Enter a valid email!"
            return false
        }
        return true
    }
}
