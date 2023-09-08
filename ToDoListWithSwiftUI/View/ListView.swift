//
//  ListView.swift
//  ToDoListWithSwiftUI
//
//  Created by Андрей Коваленко on 06.09.2023.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var listViewModel: ListViewModel
    
    
    var body: some View {
        ZStack {
            if listViewModel.items.isEmpty {
                EmptyListView()
                    .transition(.opacity.animation(.easeIn))
            } else {
                List {
                    ForEach(listViewModel.items) { item in
                        ListItem(item: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    listViewModel.updateCompletion(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItems)
                }
            }
        }
        .navigationTitle("To-Do List")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink(destination: AddNewItemView()) {
                    Image(systemName: "plus.circle")
                }
                .tint(Color("BackSet"))
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                EditButton()
                    .tint(Color("BackSet"))
            }
        }
    }

}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ListView()
        }
        .environmentObject(ListViewModel())
    }
}
