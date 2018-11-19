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
        let configuration = SFSafariViewController.Configuration()
        // change false and true, then compile and see the changes of the bars
        configuration.barCollapsingEnabled = false
        let controller = SFSafariViewController(url: url!, configuration: configuration)
        present(controller, animated: true, completion: nil)
    }
}

