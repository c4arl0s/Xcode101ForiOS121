//
//  ViewController.swift
//  LoadingAwebSiteWithSafariViewController
//
//  Created by Carlos Santiago Cruz on 11/18/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func openWebButtonnTapped(_ sender: UIButton) {
        let url = URL(string: "https://www.apple.com")
        let controller = SFSafariViewController(url: url!)
        controller.dismissButtonStyle = .close
        controller.preferredBarTintColor = UIColor(red: 81/255, green: 91/255, blue: 119/255, alpha: 1.0)
        controller.preferredControlTintColor = UIColor.white
        
        present(controller, animated: true, completion: nil)
    }


}

