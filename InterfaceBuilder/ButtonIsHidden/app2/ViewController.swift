//
//  ViewController.swift
//  app2
//
//  Created by Carlos Santiago Cruz on 09/07/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var TituloImagenVisor: UIImageView!
    
    @IBOutlet weak var FondoImagenVisor: UIImageView!
    
    @IBOutlet weak var PresionaBoton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.TituloImagenVisor.isHidden = false
        self.FondoImagenVisor.isHidden = false
        self.PresionaBoton.isHidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

