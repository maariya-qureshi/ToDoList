//
//  NewToDoView.swift
//  ToDoList
//
//  Created by Maariya Qureshi on 7/14/25.
//
//THis is the view where the user will add title and indicate the importance of their new to-do items

import SwiftUI

struct NewToDoView: View {
    var body: some View {
        VStack {
            Text("Task title:")
                .font(.title)
                .fontWeight(.bold)
            TextField("Enter the task description...", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                .padding()
                .background(Color(.systemGroupedBackground))
                .cornerRadius(15)
                .padding()
            
            //feature for user to mark task as important:
            Toggle(isOn: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Is On@*/.constant(true)/*@END_MENU_TOKEN@*/)
            {
                //Label:
                Text("Is it important?")
                    .padding()
            }
            
            //button so users can save item to their to-do list:
            Button
            {
                
            } label :
            {
                Text("Save")
                    .foregroundColor(Color.purple)
            }
        }
        .padding()
    }
}

#Preview {
    NewToDoView()
}
