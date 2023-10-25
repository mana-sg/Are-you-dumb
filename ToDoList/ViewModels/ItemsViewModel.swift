//
//  ItemsViewModel.swift
//  ToDoList
//
//  Created by MANAS G MUTALIKDESAI on 03/10/23.
//

import FirebaseFirestore
import Foundation

//Primary Tab

class ItemsViewModel: ObservableObject {
    @Published var showingNewItemview = false
    
    private let userId: String
    
    init(userId:String) {
        self.userId = userId
    }
    
    
    /// Deleting item
    /// - Parameter id: item id description
    func delete(id: String){
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todo")
            .document(id)
            .delete()
        
    }
}
