//
//  ViewController.swift
//  Planets
//
//  Created by Carlos Santiago Cruz on 18/08/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var distanceBox: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let planetMars = Planet.Mars
        distanceBox.text = "\(planetMars.distanceFromAU(otherPlanet: .Jupiter))"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

