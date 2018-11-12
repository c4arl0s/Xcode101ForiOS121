//
//  ViewController.swift
//  CreatingaViewFromCode
//
//  Created by Carlos Santiago Cruz on 04/10/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewDidAppear(_ animated: Bool) {
     
        let rectangule = CGRect(x: 90, y: 80, width: 200, height: 40)   // creating a rectangule
        let myView = UIView(frame: rectangule)                          // creating the view passing the value rectangule
        myView.backgroundColor = UIColor.red                            // setting the background to red
        self.view.addSubview(myView)                                    // adding the subview to the actual view
        // Do any additional setup after loading the view, typically from a nib.
        let labaledRectangule = CGRect(x: 35, y: 15, width: 200, height: 20)
        let myLabel = UILabel(frame: labaledRectangule)
        myLabel.text = "hola, cómo estas ?"
        myLabel.backgroundColor = UIColor.white
        myView.addSubview(myLabel)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

