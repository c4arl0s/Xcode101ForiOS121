//
//  ViewController.swift
//  EncodingURLs
//
//  Created by Carlos Santiago Cruz on 11/17/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

// encoding URLs
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func buttonTapped(_ sender: UIButton) {
        let web = "https://www.youtube.com/watch?v=ZK3U92URi_c&index=5&list=PLLKo1QSUktwvkI9QclwzuiY1Ot-xc9u2J&t=2079s"
        let dataURL = web.data(using: String.Encoding.utf8, allowLossyConversion: false)
        let webURL = URL(dataRepresentation: dataURL!, relativeTo: nil, isAbsolute: true)
        let app = UIApplication.shared
        app.open(webURL!, options: [:]) { (success) in
            if success {
                print("Successful")
            }
        }
    }

}

