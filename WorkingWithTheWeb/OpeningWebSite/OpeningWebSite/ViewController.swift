//
//  ViewController.swift
//  OpeningWebSite
//
//  Created by Carlos Santiago Cruz on 11/17/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func buttonTapped(_ sender: UIButton) {
        let web = "https://www.apple.com"
        if let urlWeb = URL (string: web) {
            let app = UIApplication.shared
            app.open(urlWeb, options: [:], completionHandler: { (success) in
                if success {
                    print("succesfull")
                }
            })
        }
    }
}

