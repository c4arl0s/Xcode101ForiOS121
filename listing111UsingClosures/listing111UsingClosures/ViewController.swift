//
//  ViewController.swift
//  listing111UsingClosures
//
//  Created by Carlos Santiago Cruz on 12/1/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let incrementor = first()
        print("The count is \(incrementor)")
    }
    func first() -> () -> Int in {
    var counter = 0
    return { () -> Int in
    counter += 1
    return counter }
    }
}

