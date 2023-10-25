//
//  EachItemView.swift
//  ToDoList
//
//  Created by MANAS G MUTALIKDESAI on 03/10/23.
//

import SwiftUI

struct EachItemView: View {
    @StateObject var viewModel = EachItemViewModel()
    let item: ListItem
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(item.title)
                    .font(.body)
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundStyle(Color(.secondaryLabel))
            }
            
            
            Spacer()
            
            Button {
                viewModel.toggleIsDone(item: item)
            } label: {
                Image(systemName: item.isDone ? 
                      "checkmark.circle.fill" : "circle")
                .foregroundColor(Color/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            }
            
        }
    }
}

#Preview {
    EachItemView(item: .init(id: "123", title: "Get Milk", dueDate: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: true, sendNotification: true))
}
