//
//  ViewController.swift
//  howDoesMVCpatternWorks
//
//  Created by Carlos Santiago Cruz on 03/10/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var inCaseEmptyFieldLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func addContactButtonPressed(_ sender: UIButton) {
        guard let name = nameTextField.text, name != "" else {return inCaseEmptyFieldLabel.text = "name is empty"}
        guard let lastName = lastNameTextField.text, lastName != "" else {return inCaseEmptyFieldLabel.text = "lastName is empty"}
        guard let phoneNumber = phoneNumberTextField.text, phoneNumber != "" else {return inCaseEmptyFieldLabel.text = "phoneNumber is empty"}
        inCaseEmptyFieldLabel.text = "all fields are filled"
        let person = Person(name: name, lastName: lastName, phoneNumber: Int(phoneNumber)!)
        print("the name of the contact is: \(String(describing: person.name)) \(String(describing: person.lastName))) and the phone number is: \(String(describing: person.phoneNumber))")
    }
    

}

