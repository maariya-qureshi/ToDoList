//
//  ContentView.swift
//  ToDoList
//
//  Created by Maariya Qureshi on 7/14/25.
//

import SwiftUI
//adding importSwiftData:
import SwiftData

struct ContentView: View {
    
    //instead of nav stack, we are using a different way to open a new view to create a task
    @State private var showNewTask = false
    //telling SwiftData to load ToDoItem objects into one array: toDos whenever we add objects in the future:
    @Query var toDos: [ToDoItem]
    
    var body: some View {
    
        VStack {
            HStack {
                Text("To-Do List")
                    .font(.system(size: 40))
                    .fontWeight(.black)
                Spacer()
                
                //adding "+" button 
                Button
                {
                    //makes the UI appear more smoothly:
                    withAnimation
                    {
                        showNewTask = true
                    }
                    
                } label :
                {
                    Text("+")
                        .font(.title)
                        .fontWeight(.bold)
                }
            }
            .padding()
            Spacer()
            
            //List View to display each item:
            List
            {
                ForEach(toDos) { toDoItem in
                    
                    if toDoItem.isImportant
                    {
                        Text(" ‼ " + toDoItem.title)
                    }
                    else
                    {
                        Text(toDoItem.title)
                    }
                }
            }
            .listStyle(.plain)
        }
        
        //displays newToDoView if button (+) is clicked (DISPLAYS AT BOTTOM)
        //if it was placed above VStack the view would appear at the top
        if showNewTask
        {
            //providing default values for the NewToDo view
            NewToDoView(showNewTask: $showNewTask, toDoItem: ToDoItem(title: "", isImportant: false))
        }
    }
}

#Preview {
    ContentView()
    //adding modelcontainer to see changes or new added to-dos in preview:
        .modelContainer(for: ToDoItem.self, inMemory: true)
}
