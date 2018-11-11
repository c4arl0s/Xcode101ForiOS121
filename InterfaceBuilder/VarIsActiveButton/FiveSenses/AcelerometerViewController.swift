//
//  AcelerometerViewController.swift
//  FiveSenses
//
//  Created by Carlos Santiago Cruz on 19/10/18.
//  Copyright © 2018 fi.unam.mx. All rights reserved.
//

import UIKit

class AcelerometerViewController: UIViewController {
    @IBOutlet weak var xLabel: UILabel!
    @IBOutlet weak var yLabel: UILabel!
    @IBOutlet weak var zLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
  
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    var isActive: Bool? = false {
        didSet {
            guard let active = isActive else { return }
            if active {
                startButton.setTitle("stop", for: .normal)
                startButton.backgroundColor = UIColor.red
            } else {
                startButton.setTitle("start", for: .normal)
                startButton.backgroundColor = UIColor.green
            }
        }
    }
    @IBAction func onTappStart (_ sender: UIButton){
        self.isActive = !(isActive ?? false)
    
        }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
