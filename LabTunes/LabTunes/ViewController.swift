//
//  ViewController.swift
//  LabTunes
//
//  Created by Carlos Santiago Cruz on 09/11/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        guard let userName = userNameTextField.text else {return}
        guard let password = passwordTextField.text else {return}
        if User.login(userName: userName, password: password) {
            performSegue(withIdentifier: "loginSucces", sender: self)
        } else { print("Password or user name wrong") }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

