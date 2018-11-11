//
//  ViewController.swift
//  Light
//
//  Created by Carlos Santiago Cruz on 17/08/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var lightOn = true
    
    @IBOutlet weak var lightButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func updateID () {
        if lightOn {
            view.backgroundColor = .white
        }
        else {
            view.backgroundColor = .black
        }
    }
    
    @IBAction func lightButtonPressed(_ sender: Any) {
        lightOn = !lightOn
        
        if lightOn {
            view.backgroundColor = .white
        }
        else {
            view.backgroundColor = .black
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

