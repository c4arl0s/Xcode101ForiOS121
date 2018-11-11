//
//  ViewController.swift
//  viewOneColor
//
//  Created by Carlos Santiago Cruz on 11/08/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var viewBox: UIView!
    @IBOutlet weak var activeButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()     //no tocar
        initializeColorBox()
        updateButton()
    }
    func initializeColorBox() {
        viewBox.layer.borderWidth = 10
        viewBox.layer.cornerRadius = 18
        viewBox.layer.borderColor = UIColor.black.cgColor
    }
    func updateButton() {
        if activeButton.isEnabled
        {
        }
    }
    
    @IBAction func buttonChanged(_ sender: Any) {
        viewBox.layer.borderColor = UIColor.red.cgColor
    }
    @IBAction func resetChanged(_ sender: Any) {
        initializeColorBox()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

