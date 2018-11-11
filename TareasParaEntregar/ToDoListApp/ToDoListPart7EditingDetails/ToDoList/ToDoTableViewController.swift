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
        if let savedToDos = ToDo.loadToDos() { // savedToDos = nil, then pass to else
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
        // Update the Unwind Segue Logic
        // how will the app know whether to add a new item or update an existing one?
        guard segue.identifier == "saveUnwind" else { return }
        let sourceViewController = segue.source as! ToDoViewController

        if let todo = sourceViewController.todo {
            if let selectedIndexPath = tableView.indexPathForSelectedRow { // if you can create the constan, then ...
                todos[selectedIndexPath.row] = todo
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            } else { // if you cannot create the constant then else
                let newIndexPath = IndexPath(row: todos.count, section: 0)
                todos.append(todo)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // When you push from the list to the detail view controller,
        // you need to pass the model object from the list to the static table view controller.
        // Use the prepare(for:sender:) method to downcast the destination to your view controller subclass.
        // Then, use the index path of the selected row to access the corresponding model,
        // and set the model property in the destination:
        if segue.identifier == "showDetails" {
            let todoViewController = segue.destination as! ToDoViewController
            let indexPath = tableView.indexPathForSelectedRow!
            let selectedTodo = todos[indexPath.row]
            todoViewController.todo = selectedTodo
            // “So what's your next move?
        }
    }
    
}

