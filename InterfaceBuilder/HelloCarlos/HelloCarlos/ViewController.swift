//
//  ViewController.swift
//  HelloCarlos
//
//  Created by Carlos Santiago Cruz on 13/08/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nameFieldText: UITextField!
    @IBOutlet weak var buttonDone: UIButton!
    @IBOutlet weak var greetLabelText: UILabel!
    
    override func viewDidLoad() {
    super.viewDidLoad()
    initializeNameFieldText ()
    initializeButtonDone()
    initializeTextLabel()
    }
    
    func initializeTextLabel(){
        greetLabelText.textAlignment = NSTextAlignment.center
    }
    
    func initializeButtonDone(){
        buttonDone.tintColor = UIColor(red: 0.3, green: 0.5, blue: 0.7, alpha: 0.9)
        buttonDone.layer.borderWidth = 5
        buttonDone.layer.cornerRadius = 20
        buttonDone.layer.borderColor = UIColor.black.cgColor
        buttonDone.layer.backgroundColor = UIColor.black.cgColor
    }
    
    func initializeNameFieldText () {
        nameFieldText.textColor = UIColor(red: 0.1, green: 0.5, blue: 0.9, alpha: 1)
        nameFieldText.textAlignment = NSTextAlignment.center
        nameFieldText.layer.borderWidth = 5
        nameFieldText.layer.cornerRadius = 20
        nameFieldText.layer.borderColor = UIColor.black.cgColor
        nameFieldText.text = ""
    }
    
    func randomInt(min: Int, max: Int) -> Int {
        return min + Int(arc4random_uniform(UInt32(max - min + 1)))
    }
    
    @IBAction func buttonDonePressed(_ sender: Any) {
      buttonDone.layer.backgroundColor = UIColor.red.cgColor
        if ( nameFieldText.text?.isEmpty )! {
            initializeButtonDone()
            let possibleAnswers = [ "escribe 🤣 !", "no tengas pena! 😳", "no quieres saber que pasa? 🤷🏽‍♂️", "ingresa nombre! 😡", "me estoy aburriendo! 🤨", "haz algo! 🤪" ]
            let numberOfAnswers = possibleAnswers.count
            let index = randomInt(min: 0, max: (numberOfAnswers-1))
            greetLabelText.text = possibleAnswers[index]
        }
        else { greetLabelText.text = "😝 Hello " + nameFieldText.text! }
    }
    
    @IBOutlet weak var resetButtonName: UIButton!
    @IBAction func resetButtonPressed(_ sender: Any) {
        greetLabelText.text = "vuelve a ingresar nombre"
        initializeNameFieldText()
        initializeButtonDone()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

