//
//  RegisterViewModel.swift
//  ToDoList
//
//  Created by MANAS G MUTALIKDESAI on 03/10/23.
//

import FirebaseFirestore
import Foundation
import FirebaseAuth

class RegisterViewModel: ObservableObject {
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    
    init() {}
    
    func register(){
        guard validate() else {
            return
        }
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            guard let userId = result?.user.uid else{
                return
            }
            
            self.insertUserId(id: userId)
        }
        
    }
    
    
    private func insertUserId(id: String){
        let newUser = User(id: id, name: name,
                           email: email,
                           joined: Date().timeIntervalSince1970)
            
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(id)
            .setData(newUser.asDict())
    }
    
    
    private func validate() -> Bool {
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else{
            return false
        }
        
        guard email.contains("@") && email.contains(".") else{
            return false
        }
        
        guard password.count >= 6 else{
            return false
        }
        return true
    }
}
