//
//  ViewController.swift
//  VariableShadowing
//
//  Created by Carlos Santiago Cruz on 12/9/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // this next example defines a variable called points in two different locations: within the functions local scope and within the for loops local scope.
    // this is called variable shadowing.
    // sometimes is not obvious to see it
    
    override func viewDidLoad() {
        super.viewDidLoad()
        printComplexScope()
    }
    func printComplexScope() {
        // you can use the same name of variable but in different scope
        var points = 100
        print(points)
        for index in 1...3 {
            var points = 200
            print("Loop \(index): \(points+index)")
        }
        print(points)
    }


}

