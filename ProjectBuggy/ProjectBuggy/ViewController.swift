//
//  ViewController.swift
//  ProjectBuggy
//
//  Created by Carlos Santiago Cruz on 12/15/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    enum IteratorErrors: Error {
        case notEnoughOddNumbers
        case notEnoughEvenNumbers
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func buttonTapped(_ sender: UIButton)
    {
        do {
            try iterateArray()
        } catch{}
    }
//    func iterateArray() throws {
//        try
//    }
    func iterateArray() throws {
        try [1,2,3,4,5,6,7,8].forEach({ (number) in
            if (number % 2 == 0 ){
                throw IteratorErrors.notEnoughOddNumbers
            } else {
                throw IteratorErrors.notEnoughEvenNumbers
            }
        })
    }
}

