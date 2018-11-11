//
//  ToDoViewController.swift
//  ToDoList
//
//  Created by Carlos Santiago Cruz on 12/09/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import UIKit

class ToDoViewController: UITableViewController {
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var isCompletButton: UIButton!
    @IBOutlet weak var dueDateLabel: UILabel!
    @IBOutlet weak var dueDatePickerView: UIDatePicker!
    @IBOutlet weak var notesTextView: UITextView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    //variable declared to store the value if the picker is hidden
    var isPickerHidden = true
    // declare a ToDo type variable
    var todo: ToDo?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let todo = todo { // if you can create the constant then ...
            navigationItem.title = "To-Do"
            titleTextField.text = todo.title
            isCompletButton.isSelected = todo.isComplete
            dueDatePickerView.date = todo.dueDate
            notesTextView.text = todo.notes
        } else { // if you cannot create the constant then ... else
            dueDatePickerView.date =
                Date().addingTimeInterval(24*60*60)
        }
        updateDueDateLabel(date: dueDatePickerView.date)
        updateSaveButtonState()
    }
    
    func updateSaveButtonState() {
        // Next, write a helper method that updates the Save button depending on whether or not text exists in the text field.
        // If the string is empty, disable the button; otherwise, enable it:
        let text = titleTextField.text ?? ""
        saveButton.isEnabled = !text.isEmpty
    }
    @IBAction func textEditingChanged(_ sender: UITextField) {
        // Create a new action, called "textEditingChanged,"
        // which will fire whenever the Editing Changed control event takes place.
        updateSaveButtonState()
    }
    
    @IBAction func returnPressed(_ sender: UITextField) {
        // it would be great if the user could tape the Return Key
        // on the keyboard to dissmis it
        // observe after finished to fill what you want to writethen tap enter.
        titleTextField.resignFirstResponder()
    }
    @IBAction func isCompleteButtonTapped(_ sender: UIButton) {
        // When the user taps the isCompleteButton, you want the image to toggle between the empty circle and the checkmark image.
        // Earlier in this project, you added two images to reflect the button's Normal state and its Selected state
        isCompletButton.isSelected = !isCompletButton.isSelected
    }
    func updateDueDateLabel(date: Date) {
        // write a helper method in your view controller to update dueDateLabel with the date passed into the method as a parameter.
        // This method should be called in viewDidLoad() and whenever the date picker value changes:
        dueDateLabel.text = ToDo.dueDateFormatter.string(from: date)
    }
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        // action that's fired whenever the user changes the date picker
        // tie the action to the Primary Action Triggered event.
        updateDueDateLabel(date: dueDatePickerView.date)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // Expand and Collapse the Date Picker Cell
        // the method detect when you tap an specific Row depending of the IndexPath
        let normalCellHeight = CGFloat(44)
        let largeCellHeight = CGFloat(200)
        switch(indexPath) {
        case [1,0]: //Due Date Cell  [section 1, row 0]
            return isPickerHidden ? normalCellHeight : largeCellHeight
        case [2,0]: //Notes Cell     [section 2, row 0]
            return largeCellHeight
        default: return normalCellHeight
        }
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Next, your app will need to respond to the user tapping the Due Date cell, which will change isPickerHidden to false.
        switch (indexPath) {
        // pick the right Row [section 1, row 0]
        case [1,0]:
            isPickerHidden = !isPickerHidden
            dueDateLabel.textColor = isPickerHidden ? .blue : tableView.tintColor
            // Begins a series of method calls that insert, delete, or select rows and sections of the table view.
            tableView.beginUpdates()
            // Concludes a series of method calls that insert, delete, select, or reload rows and sections of the table view.
            tableView.endUpdates()
        default: break
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 1.- Verify that the saveUnwind segue is being performed
        // 2.- You will read the values from the appropiete controls
        // 3.- store them into constants
        // 4.- pass the values into your models initializer.
        super.prepare(for: segue, sender: sender)
        guard segue.identifier == "saveUnwind" else { return }
        let title = titleTextField.text!
        let isComplete = isCompletButton.isSelected
        let dueDate = dueDatePickerView.date
        let notes = notesTextView.text
        todo = ToDo(title: title, isComplete: isComplete, dueDate: dueDate, notes: notes)
    }
    
    
}
