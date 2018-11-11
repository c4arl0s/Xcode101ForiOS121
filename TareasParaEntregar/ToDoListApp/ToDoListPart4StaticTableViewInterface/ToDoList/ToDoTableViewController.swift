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
    // adding a method in your UITableViewController subclass that allows future button taps to unwind to this view controller. You'll probably recognize the following unwind segue from previous lessons.
    @IBAction func unwindToToDoList(segue: UIStoryboardSegue) {
        
    }
}

