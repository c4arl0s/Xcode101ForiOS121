//
//  SecondViewController.swift
//  TypeCastingAndInspection
//
//  Created by Carlos Santiago Cruz on 12/9/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var valuePassedLabel: UILabel!
    var names: [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let arrayOfNames = self.names {
            print("\(String(describing: arrayOfNames))")
            valuePassedLabel.text = String(describing: arrayOfNames)
        } else {
            print("there is no presence of values")
        }
    }


}
