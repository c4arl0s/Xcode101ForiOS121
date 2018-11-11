//
//  ViewController.swift
//  WorldTrotter
//
//  Created by Carlos Santiago Cruz on 14/09/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
override func viewDidLoad() {
    super.viewDidLoad()
    let firstFrame = CGRect(x: 160, y: 240, width: 100, height: 300)
    let firstView = UIView(frame: firstFrame)
    firstView.backgroundColor = UIColor.blue
    view.addSubview(firstView)
    
    let secondFrame = CGRect(x: 20, y: 30, width: 50, height: 50)
    let secondView = UIView(frame: secondFrame)
    secondView.backgroundColor = UIColor.green
    view.addSubview(secondView)
}
}

