//
//  ViewController.swift
//  FailableInitializers
//
//  Created by Carlos Santiago Cruz on 12/9/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let possibleToddler = Toddler(name: "Carlos", monthsOld: 14)
        if let toddler = possibleToddler {
            print("\(toddler.name) is \(toddler.monthsOld)")
        } else {
            print("The age you specified for the toddler is not beetwen 1 and 3")
        }
        
    }


}

