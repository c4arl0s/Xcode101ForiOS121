//
//  ViewController.swift
//  GlassWaterCounter
//
//  Created by Carlos Santiago Cruz on 13/10/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var counterView: CounterView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func plusButtonTapped(_ sender: ActionButton) {
            counterView.counter = counterView.counter + 1
    }
    
    @IBAction func minusButtonTapped(_ sender: ActionButton) {
            counterView.counter = counterView.counter -  1
    }

}

