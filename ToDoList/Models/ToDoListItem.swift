//
//  ToDoListItem.swift
//  ToDoList
//
//  Created by MANAS G MUTALIKDESAI on 03/10/23.
//

import Foundation


struct ListItem: Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    let sendNotification: Bool
    
    mutating func setDone(_ state: Bool) {
        isDone = state
    }
}
