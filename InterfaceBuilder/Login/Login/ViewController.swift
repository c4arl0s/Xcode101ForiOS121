//
//  ViewController.swift
//  Login
//
//  Created by Carlos Santiago Cruz on 30/08/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var forgotUserNameButton: UIButton!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // now we have to downcast, son la 1:20.
        guard let sender = sender as? UIButton else {return}
        if sender == forgotPasswordButton { segue.destination.navigationItem.title = "Forgot Password" }
        else if sender == forgotUserNameButton { segue.destination.navigationItem.title = "Forgot Username" }
        else { segue.destination.navigationItem.title = userNameTextField.text }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func forgotUserNameButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "ForgottenUsernameOrPassword", sender: forgotUserNameButton)
        }
    @IBAction func forgotPasswordButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "ForgottenUsernameOrPassword", sender: forgotPasswordButton)
    }
    @IBAction func unwindToLogInscreen(unwindSegue: UIStoryboardSegue) {
        // notice that there's no IBOutlet, ask why ?
        // “In this lesson, the method you just added doesn't contain any code, but it can be used to pass information from the end point of the segue back to the source view controller.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

