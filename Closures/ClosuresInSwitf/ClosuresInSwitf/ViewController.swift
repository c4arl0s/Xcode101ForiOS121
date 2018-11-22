//
//  ViewController.swift
//  ClosuresInSwitf
//
//  Created by Carlos Santiago Cruz on 11/21/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let sumNumbers: ((Int, Int) -> Int) = { firstNumber, secondNumber -> Int in
            return firstNumber + secondNumber
        }
        let sum = sumNumbers(10,4)
        print("function using a closure sum = \(sum)")
    
    }
}

