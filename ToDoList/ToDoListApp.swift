//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Maariya Qureshi on 7/14/25.
//

import SwiftUI
//importing SwiftData
import SwiftData

@main
struct ToDoListApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
            //adding in modelContainer (responsible for loading/saving data in devices storage): 
                .modelContainer(for: ToDoItem.self)
        }
    }
}
