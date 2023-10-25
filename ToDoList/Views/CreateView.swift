//
//  CreateView.swift
//  ToDoList
//
//  Created by MANAS G MUTALIKDESAI on 03/10/23.
//

import SwiftUI

struct CreateView: View {
    @StateObject var viewModel = CreateViewModel()
    @Binding var newItemAdded: Bool
    
    var body: some View {
        VStack{
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 100)
            
            Form {
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                DatePicker("WHEN?", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                Toggle("Remind me I'm dumb!", isOn: $viewModel.sendNotification)
                    .tint(.pink)
                    .bold()
                    
                
                ButtonD(title: "Save", bgClr: .pink){
                    if viewModel.canSave {
                        viewModel.save()
                        newItemAdded = false
                    } else {
                        viewModel.showAlert = true
                    }
                }
                .padding()
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("Error"),
                      message: Text("Get the details right FFS!"))
            }
        }
    }
}

#Preview {
    CreateView(newItemAdded: Binding(get: {
        return true
    }, set: {_ in
    }))
}
