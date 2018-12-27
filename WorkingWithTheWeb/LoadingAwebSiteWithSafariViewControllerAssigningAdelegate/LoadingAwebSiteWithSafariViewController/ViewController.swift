//
//  ViewController.swift
//  LoadingAwebSiteWithSafariViewController
//
//  Created by Carlos Santiago Cruz on 11/18/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController, SFSafariViewControllerDelegate {
    @IBOutlet weak var openWebButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func openWebButtonnTapped(_ sender: UIButton) {
        let url = URL(string: "http://23.253.47.149/Scripts/OnlineJVCV.isa/EXEC/1/1ls185i1xclsqu13b9pre1w1xbbi")
        let controller = SFSafariViewController(url: url!)
        controller.delegate = self
        present(controller, animated: true, completion: nil)
    }
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        openWebButton.isEnabled = false
    }
    // wow, tapped the button, but when you press done, the method disable the button openWebButton.
    // remember, delegate patter comunicate viewcontroller, the SafariViewController send the message to disable the button of the first ViewCOntroller.

}

