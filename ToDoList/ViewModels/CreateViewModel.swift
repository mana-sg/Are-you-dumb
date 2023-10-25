//
//  CreateViewModel.swift
//  ToDoList
//
//  Created by MANAS G MUTALIKDESAI on 03/10/23.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation
import UserNotifications


class CreateViewModel: ObservableObject {
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert: Bool = false
    @Published var sendNotification: Bool = true
    
    init() {}
    
    func setReminderNotification() {
        
        if sendNotification {
            let currentTime = Date().timeIntervalSince1970
            let notificationTime = (dueDate.timeIntervalSince1970 - 3600) - currentTime
            
            if notificationTime > 0 {
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        print("All set!")
                    } else if let error = error {
                        print(error.localizedDescription)
                    }
                }
                
                let content = UNMutableNotificationContent()
                content.title = "Do it NOW!"
                content.subtitle = title
                content.sound = UNNotificationSound.default
                
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: notificationTime, repeats: false)
                
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                
                UNUserNotificationCenter.current().add(request)
            }
        }
    }
    
    func save() {
        guard canSave else {
                return
        }
        
        guard let uId = Auth.auth().currentUser?.uid else{
            return
        }
        
        let newId = UUID().uuidString
        let newItem = ListItem(id: newId,
                               title: title,
                               dueDate: dueDate.timeIntervalSince1970,
                               createdDate: Date().timeIntervalSince1970,
                               isDone: false,
                               sendNotification: sendNotification)
        
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uId)
            .collection("todo")
            .document(newId)
            .setData(newItem.asDict())
        
        setReminderNotification()
        
        

    }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else{
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-86400) else{
            return false
        }
        return true
    }
}
