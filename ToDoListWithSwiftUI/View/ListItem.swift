//
//  ListItem.swift
//  ToDoListWithSwiftUI
//
//  Created by Андрей Коваленко on 06.09.2023.
//

import SwiftUI

struct ListItem: View {
    
    let item: ItemModel

    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .blue : .black)
            Text(item.title)
        }
        .font(.title2)
        .padding(.vertical, 5)
    }
}

struct ListItem_Previews: PreviewProvider {
    
    static var item1 = ItemModel(title: "First",isCompleted: false)
    static var item2 = ItemModel(title: "Second", isCompleted: true)
    
    static var previews: some View {
        Group {
            ListItem(item: item1)
            ListItem(item: item2)
        }.previewLayout(.sizeThatFits)
    }
}
