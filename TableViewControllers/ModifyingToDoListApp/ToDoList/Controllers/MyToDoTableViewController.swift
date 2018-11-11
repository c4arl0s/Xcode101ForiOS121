//
//  TableViewController.swift
//  ToDoList
//
//  Created by Carlos Santiago Cruz on 07/09/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import UIKit

class MyToDoTableViewController: UITableViewController, ToDoCellDelegate {

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
        // “Use the following code to conditionally downcast this cell to your custom class so that it matches the type of cell defined in the storyboard.
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCellIdentifier") as? ToDoCell
            else { fatalError("Could not dequeue a cell") }
        let todo = todos[indexPath.row]
        cell.titleLabel?.text = todo.title
        cell.isCompleteButton.isSelected = todo.isComplete
        cell.delegate = self
        return cell
    }
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            todos.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            ToDo.saveToDos(todos)
        }
    }
    
    @IBAction func unwindToToDoList(segue: UIStoryboardSegue) {
        // Update the Unwind Segue Logic
        // how will the app know whether to add a new item or update an existing one?
        guard segue.identifier == "saveUnwind" else { return }
        let sourceViewController = segue.source as! NewToDoViewController
        
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
        ToDo.saveToDos(todos)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // When you push from the list to the detail view controller,
        // you need to pass the model object from the list to the static table view controller.
        // Use the prepare(for:sender:) method to downcast the destination to your view controller subclass.
        // Then, use the index path of the selected row to access the corresponding model,
        // and set the model property in the destination:
        if segue.identifier == "showDetails" {
            let todoViewController = segue.destination as! NewToDoViewController
            let indexPath = tableView.indexPathForSelectedRow!
            let selectedTodo = todos[indexPath.row]
            todoViewController.todo = selectedTodo
            // “So what's your next move?
        }
    }
    // MARK: Conform the Protocol
    func checkmarkTapped(sender: ToDoCell) {
        // All that's left is to determine the index path of the cell,
        // which you'll use to flip the isComplete Boolean of the corresponding ToDo.
        // Once you've updated the model, reload the cell so that its appearance is up to date with the data.
        // Here's the code:
        if let indexPath = tableView.indexPath(for: sender) {
            var todo = todos[indexPath.row]
            todo.isComplete = !todo.isComplete
            todos[indexPath.row] = todo
            tableView.reloadRows(at: [indexPath], with: .automatic)
            ToDo.saveToDos(todos)
        }
    }

}

