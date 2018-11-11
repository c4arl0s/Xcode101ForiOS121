//
//  ToDo.swift
//  ToDoList
//
//  Created by Carlos Santiago Cruz on 07/09/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import Foundation

struct ToDo {
    var title: String
    var isComplete: Bool
    var dueDate: Date
    var notes: String?  // may exist or may not exist notes
    
    init(title: String, isComplete: Bool, dueDate: Date, notes: String?)
    {
        self.title = title
        self.isComplete = isComplete
        self.dueDate = dueDate
        self.notes = notes
    }
    // retrieves the array of items stored on disk and returns them if the disk contains any items.
    static func loadToDos() -> [ToDo]? {    //may exist or may not exist an array
        return nil
    }
    static func loadSampleToDos() -> [ToDo] { // return an array of 3 elements, it is a sample of ToDO's
        let todo1 = ToDo(title: "ToDo One", isComplete: false, dueDate: Date(), notes: "Notes 1")
        let todo2 = ToDo(title: "ToDo Two", isComplete: false, dueDate: Date(), notes: "Notes 2")
        let todo3 = ToDo(title: "ToDo Three", isComplete: false, dueDate: Date(), notes: "Notes 3")
        return [todo1, todo2, todo3]
    }
}
// declares an empty array of objects ToDo 
var todos = [ToDo]()
