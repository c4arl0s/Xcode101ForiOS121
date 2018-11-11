//
//  ViewController.swift
//  CommonInputControls
//
//  Created by Carlos Santiago Cruz on 22/08/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var `switch`: UISwitch!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet var tapGesture: UITapGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func buttonTapped(_ sender: Any) {
        print("button was tapped")
        if `switch`.isOn {print("the switch is on")}
        else {print("the switch is off")}
        print("the slider is set to \(slider.value)")
        
    }
    @IBAction func switchToggled(_ sender: UISwitch) {
        if sender.isOn {
            print("the switch is on")
        } else { print("the switch is off")}
    }
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        print(sender.value)
    }
    @IBAction func keyboardReturnKeyTapped(_ sender: UITextField) {
        if let  text = sender.text { print(text)}
    }
    @IBAction func textChanged(_ sender: UITextField) {
        if let  text = sender.text { print(text)}
    }
    @IBAction func respondToTapGesture(_ sender: UITapGestureRecognizer) {
        print("one tap")
        let location = sender.location(in: view)
        print(location)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

