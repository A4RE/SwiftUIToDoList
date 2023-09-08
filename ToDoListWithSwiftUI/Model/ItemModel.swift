//
//  ItemModel.swift
//  ToDoListWithSwiftUI
//
//  Created by Андрей Коваленко on 07.09.2023.
//

import Foundation

// immutable struct
struct ItemModel: Identifiable {
    let id: String
    let title: String
    var isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updCompletion() -> ItemModel {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}
