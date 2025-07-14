//
//  ToDoItem.swift
//  ToDoList
//
//  Created by Maariya Qureshi on 7/14/25.
//

import Foundation
//importing SwiftData framework:
import SwiftData

//adding @Model macro to save instances of the class
@Model
class ToDoItem
{
    var title: String
    var isImportant: Bool
    
    //sets title to empty string, and isImp to false
    init(title: String, isImportant: Bool = false)
    {
        self.title = title
        self.isImportant = isImportant
    }
}
