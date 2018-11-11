//
//  ViewController.swift
//  ConnectControllsToActionsProgrammatically
//
//  Created by Carlos Santiago Cruz on 23/08/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // oooh veo que se rompe y despues lo rompes manualmente la conexion pero despues lo hace programaticamente.
        // Ver el inspector de conexiones.
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        
    }
    @IBAction func buttonTapped(_ sender: UIButton) {
        print("one tap on button")
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

