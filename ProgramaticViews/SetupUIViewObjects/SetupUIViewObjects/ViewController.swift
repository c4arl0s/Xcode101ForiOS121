//
//  ViewController.swift
//  SetupUIViewObjects
//
//  Created by Carlos Santiago Cruz on 30/10/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var customView: CustomView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customView.mainLabel.text = "hello World!"

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }


}

