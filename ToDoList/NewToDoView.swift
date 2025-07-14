//
//  NewToDoView.swift
//  ToDoList
//
//  Created by Maariya Qureshi on 7/14/25.
//
//THis is the view where the user will add title and indicate the importance of their new to-do items

import SwiftUI
//importing SwiftData
import SwiftData

struct NewToDoView: View {
    
    @Binding var showNewTask: Bool
    //creating @Bindable property wrapper to make bindings for ToDoItem objects so we can update the properties from this file:
    @Bindable var toDoItem: ToDoItem
    //environment property wrapper to access Model Context (which tracks all modified objects and stores it in the model container:)
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        VStack {
            
            Text("Task title:")
                .font(.title)
                .fontWeight(.bold)
            
            //displays the description, next to the title, verical: makes more than 1 line vertical
            TextField("Enter the task description...", text: $toDoItem.title, axis: .vertical)
                .padding()
                .background(Color(.systemGroupedBackground))
                .cornerRadius(15)
                .padding()
            
            //feature for user to mark task as important:
            //binding Toggle to isImportant property of the object
            Toggle(isOn: $toDoItem.isImportant)
            {
                //Label:
                Text("Is it important?")
                    .padding()
            }
            
            //button so users can save item to their to-do list:
            Button
            {
                //calls method:
                addToDo()
                //closes pop-up:
                showNewTask = false
            } label :
            {
                Text("Save")
                    .foregroundColor(Color.purple)
            }
        }
        .padding()
    }
    
    //rmb functions are standalone blocks of code that perform specific tasks VS methods: functions defined with specific type (struct/class)
    //addToDo() is technically a method bc defined within struct
    //this func will happen when saved button is pressed:
    func addToDo()
    {
        //creates a toDo based on what the user created
        let toDo = ToDoItem(title: toDoItem.title, isImportant: toDoItem.isImportant)
        //inserts toDo into the model context
        modelContext.insert(toDo)
    }
}

#Preview {
    NewToDoView(showNewTask: .constant(false), toDoItem: ToDoItem(title: "", isImportant: false))
}
