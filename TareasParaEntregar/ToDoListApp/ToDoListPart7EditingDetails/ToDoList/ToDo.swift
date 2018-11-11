//
//  ToDo.swift
//  ToDoList
//
//  Created by Carlos Santiago Cruz on 07/09/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import Foundation

struct ToDo {
    // model of your object
    var title: String
    var isComplete: Bool
    var dueDate: Date
    var notes: String?  // may exist or may not exist notes
    
    init(title: String, isComplete: Bool, dueDate: Date, notes: String?)
    { // initializer for the object
        self.title = title
        self.isComplete = isComplete
        self.dueDate = dueDate
        self.notes = notes
    }
    // retrieves the array of items stored on disk and returns them if the disk contains any items.
    // type method of ToDo
    // this is a type Method, you can access it by notation dot ToDo.loadTodos()
    static func loadToDos() -> [ToDo]? {    //may exist or may not exist an array
        return nil
    }
    // another type method, you can access it by the notation dot ToDo.loadSampleToDos
    static func loadSampleToDos() -> [ToDo] { // return an array of 3 elements, it is a sample of ToDO's
        let todo1 = ToDo(title: "ToDo One", isComplete: false, dueDate: Date(), notes: "Notes 1")
        let todo2 = ToDo(title: "ToDo Two", isComplete: false, dueDate: Date(), notes: "Notes 2")
        let todo3 = ToDo(title: "ToDo Three", isComplete: false, dueDate: Date(), notes: "Notes 3")
        let todo4 = ToDo(title: "ToDo Four", isComplete: false, dueDate: Date(), notes: "Notes 4")
        let todo5 = ToDo(title: "ToDo Five", isComplete: false, dueDate: Date(), notes: "Notes 5")
        return [todo1, todo2, todo3, todo4, todo5]
    }
    
    static let dueDateFormatter: DateFormatter = {
    // You'll need to create a DateFormatter object to convert a date into a string. Since date objects are time-consuming to create, it's a good practice to instantiate one when it's first needed and keep it around throughout the life of your app.
    // Your model class can include a default DateFormatter.
    // To ensure that the date object is created only once and isn't tied to a particular instance of your model, use the static keyword, type method
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    // By setting the dateStyle and timeStyle properties to short, the date string will display the date and time in the most succinct format possible.
    // For example, using this date formatter, "January 1st, 1970 at 12:00am" would appear as "1/1/1970, 12:00 AM.”
    }()
    
}
// declares an empty array of objects ToDo 
var todos = [ToDo]()
