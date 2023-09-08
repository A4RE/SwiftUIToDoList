//
//  ListViewModel.swift
//  ToDoListWithSwiftUI
//
//  Created by Андрей Коваленко on 08.09.2023.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var items: [ItemModel] = []
    
    init() {
        getItems()
    }
    
    func getItems() {
        let newItems = [
            ItemModel(title: "First Item", isCompleted: true),
            ItemModel(title: "Second Item", isCompleted: false),
            ItemModel(title: "Third Item", isCompleted: true),
            ItemModel(title: "Fourth Item", isCompleted: true)
        ]
        
        items.append(contentsOf: newItems)
    }

    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItems(indexSet: IndexSet, int: Int) {
        items.move(fromOffsets: indexSet, toOffset: int)
    }
    
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateCompletion(item: ItemModel) {
        
        if let index = items.firstIndex(where: { $0.id == item.id}) {
            items[index] = item.updCompletion()
        }
    }
    
}
