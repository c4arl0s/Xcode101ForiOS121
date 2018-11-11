//
//  ViewController.swift
//  FirstFrame
//
//  Created by Carlos Santiago Cruz on 12/10/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstFrame = CGRect(x: 160, y: 240, width: 100, height: 150)
        let firstView = UIView(frame: firstFrame)
        firstView.backgroundColor = UIColor.blue
        view.addSubview(firstView)
        
       
    }
    
//    override func loadView() {
////        let secondFrame = CGRect(x: 160, y: 240, width: 100, height: 150)
////        let secondView = UIView(frame: secondFrame)
////        secondView.backgroundColor = UIColor.green
////        view.addSubview(secondView)
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

