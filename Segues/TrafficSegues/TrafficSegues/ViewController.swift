//
//  ViewController.swift
//  TrafficSegues
//
//  Created by Carlos Santiago Cruz on 30/08/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func unwindToRed(unwindSegue: UIStoryboardSegue) {
        // notice that there's no IBOutlet, ask why ?
// “In this lesson, the method you just added doesn't contain any code, but it can be used to pass information from the end point of the segue back to the source view controller.
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

