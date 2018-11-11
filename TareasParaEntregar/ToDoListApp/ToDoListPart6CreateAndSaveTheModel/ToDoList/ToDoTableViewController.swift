//
//  TableViewController.swift
//  ToDoList
//
//  Created by Carlos Santiago Cruz on 07/09/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import UIKit

class ToDoTableViewController: UITableViewController {

    override func viewDidLoad() {
        navigationItem.leftBarButtonItem = editButtonItem
        if let savedToDos = ToDo.loadToDos() { // savedToDos = nil
            todos = savedToDos //
        } else {
            todos = ToDo.loadSampleToDos() // fill the array with the samples
        }
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count  // return the count of todos array
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCellIdentifier")
            else { fatalError("Could not dequeue a cell") }
        let todo = todos[indexPath.row]
        cell.textLabel?.text = todo.title
        return cell
    }
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            todos.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
  
    @IBAction func unwindToToDoList(segue: UIStoryboardSegue) {
        // adding a method in your UITableViewController subclass that allows future button
        // taps to unwind to this view controller.
        // You'll probably recognize the following unwind segue from previous lessons.
        
        // you'll want to verify that the saveUnwind segue is being called; otherwise,
        // there won't be any work to perform when the Cancel button is tapped.
        // Next, you'll check to see if a model object exists in the segue's source (the view controller that triggered the segue).
        // If a model object exists, add it to the array, then add a table cell that represents the new data.
        // verify that the saveButton is the corresponding segue.
        guard segue.identifier == "saveUnwind" else { return }
        // create an instance from class TodoViewController
        let sourceViewController = segue.source as! ToDoViewController
        if let todo = sourceViewController.todo {
            let newIndexPath = IndexPath(row: todos.count, section: 0)
            todos.append(todo)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
            
        }
    }
    
}

