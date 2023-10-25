//
//  ProfileViewModel.swift
//  ToDoList
//
//  Created by MANAS G MUTALIKDESAI on 03/10/23.
//

import FirebaseFirestore
import FirebaseAuth
import Foundation

class ProfileViewModel: ObservableObject {
    init() {}
    
    @Published var user: User? = nil
    
    func fetchUser() {
        guard let userId = Auth.auth().currentUser?.uid else{
            return
        }
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .getDocument {[weak self] snapshot, error in
                guard let data = snapshot?.data(), error == nil else{
                    return
                }
                DispatchQueue.main.async {
                    self?.user = User(id: data["id"] as? String ?? "",
                                      name: data["name"] as? String ?? "",
                                      email: data["email"] as? String ?? "",
                                      joined: data["joined"] as? TimeInterval ?? 0 )
                }
        }
    }
    
    func logout() {
        do{
            try Auth.auth().signOut()
        } catch {
            print(error)
        }
    }
}
