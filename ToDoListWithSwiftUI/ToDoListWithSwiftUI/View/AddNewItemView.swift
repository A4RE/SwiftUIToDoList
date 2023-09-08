//
//  AddNewItemView.swift
//  ToDoListWithSwiftUI
//
//  Created by Андрей Коваленко on 06.09.2023.
//

import SwiftUI

struct AddNewItemView: View {
    
    @Environment(\.presentationMode) var presentMode
    @EnvironmentObject var listViewModel: ListViewModel
    
    @State var titleField: String = ""
    
    @State var isAlertShow: Bool = false
    
    @State var isAnimation: Bool = false
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 8) {
                Section {
                    TextField("Add task title here...", text: $titleField)
                        .padding()
                        .font(.headline)
                        .foregroundColor(.black)
                        .background(Color.gray.brightness(0.4))
                        .cornerRadius(10)
                } header: {
                    Text("Task title")
                        .font(.title3)
                        .foregroundColor(Color("BackSet"))
                        .bold()
                }
                Spacer()

                Button {
                    saveButtonPressed()
                    
                } label: {
                    Text("add task".uppercased())
                        .font(.headline)
                        .padding()
                        .foregroundColor(Color("TextColor"))
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .background(titleField.count < 3 ? .gray : Color("BackSet"))
                        .cornerRadius(10)
                }
                .disabled(!checkTextField() ? true : false)

            }
            .padding()
        }
        .navigationTitle("Add new task")
        .tint(Color.black)
    }
    
    func saveButtonPressed() {
        if checkTextField() {
            listViewModel.addItem(title: titleField)
            presentMode.wrappedValue.dismiss()
        } else {
            isAlertShow.toggle()
        }
    }
    
    func checkTextField() -> Bool {
        guard titleField.count < 3 else {
            return true
        }
        return false
    }
    
}

struct AddNewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AddNewItemView()
        }
        .environmentObject(ListViewModel())
    }
}
