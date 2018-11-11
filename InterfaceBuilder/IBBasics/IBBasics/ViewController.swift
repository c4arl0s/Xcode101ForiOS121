//
//  ViewController.swift
//  IBBasics
//
//  Created by Carlos Santiago Cruz on 19/08/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var myButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // setting button by code.
        myButton.setTitleColor(.red, for: .normal)
    }
    @IBAction func myButtonTouched(_ sender: Any) {
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

