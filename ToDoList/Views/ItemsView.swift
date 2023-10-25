//
//  ItemsView.swift
//  ToDoList
//
//  Created by MANAS G MUTALIKDESAI on 03/10/23.
//

import FirebaseFirestoreSwift
import SwiftUI

struct ItemsView: View {
    @StateObject var viewModel: ItemsViewModel
    @FirestoreQuery var items: [ListItem]
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
        
        self._items = FirestoreQuery(
            collectionPath: "users/\(userId)/todo")
        
        self._viewModel = StateObject(
            wrappedValue: ItemsViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView {
            VStack{
                List(items) { item in
                    EachItemView(item: item)
                        .swipeActions {
                            Button("Delete"){
                                viewModel.delete(id: item.id)
                            }
                            .tint(.red)
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Do these man!")
            .toolbar {
                Button {
                    viewModel.showingNewItemview = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemview) {
                CreateView(newItemAdded:
                            $viewModel.showingNewItemview)
            }
        }
    }
}


#Preview {
    ItemsView(userId: "oqDNQuaQ1OTwzZjAJFTWgDmlLYj2")
}
