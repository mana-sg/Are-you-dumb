//
//  EachItemViewModel.swift
//  ToDoList
//
//  Created by MANAS G MUTALIKDESAI on 03/10/23.
//

import FirebaseFirestore
import FirebaseAuth
import Foundation

//Single to do list item view

class EachItemViewModel: ObservableObject {
    init() {}
    
    func toggleIsDone(item: ListItem) {
        var newItem = item
        newItem.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else{
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todo")
            .document(newItem.id)
            .setData(newItem.asDict())
    }
}
