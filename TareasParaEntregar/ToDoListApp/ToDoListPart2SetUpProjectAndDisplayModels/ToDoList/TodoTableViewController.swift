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
        // if ToDo.loadTodos() is equal to nil, then de condition is false
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
}

