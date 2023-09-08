//
//  EmptyListView.swift
//  ToDoListWithSwiftUI
//
//  Created by Андрей Коваленко on 08.09.2023.
//

import SwiftUI

struct EmptyListView: View {
    
    @State var isAnimation: Bool = false
    
    var body: some View {
        VStack {
            Text("Your task list is empty.")
                .font(.title)
                .fontWeight(.medium)
                .padding(.bottom, 1)
            Text("Add new task by pressing button bellow")
                .padding(.bottom, 15)
            NavigationLink(destination: AddNewItemView()) {
                Text("Add Task".uppercased())
                    .font(.headline)
                    .foregroundColor(Color("TextColor"))
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(isAnimation ? Color("BackSet").opacity(0.7) : Color.gray.opacity(0.3))
                    .cornerRadius(10)
            }
            .padding(.horizontal, isAnimation ? 50 : 30)
            .shadow(color: isAnimation ? Color("BackSet").opacity(0.7) : Color.gray.opacity(0),
                    radius: isAnimation ? 10 : 0,
                    x: 0,
                    y: 10)
            .scaleEffect(isAnimation ? 1.1 : 0.9)
            .offset(y: isAnimation ? -5 : 3)
        }
        .padding(.horizontal, 20)
        .multilineTextAlignment(.center)
        .onAppear {
            addAnimation()
        }
    }
    
    func addAnimation() {
        guard !isAnimation else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            withAnimation(
                Animation.easeInOut(duration: 2.0)
                    .repeatForever()
            ) {
                isAnimation.toggle()
            }
        }
    }
    
}

struct EmptyListView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyListView()
    }
}
