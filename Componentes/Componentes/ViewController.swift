//
//  ViewController.swift
//  Componentes
//
//  Created by Carlos Santiago Cruz on 18/08/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }

    @IBAction func sliderSlided(_ sender: Any) {
        if ((slider.value <= 0.3) && (slider.value >= 0.0 )) {
            photo.image = UIImage(named: "images-4")}
        if ((slider.value <= 0.6) && (slider.value > 3)){
                photo.image = UIImage(named: "images-3")}
        if ((slider.value <= 1.0 ) && (slider.value > 0.6)) {
                photo.image = UIImage(named: "images-1")
            }
}
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

