//
//  User.swift
//  ToDoList
//
//  Created by MANAS G MUTALIKDESAI on 03/10/23.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
