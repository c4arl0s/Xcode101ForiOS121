//
//  ViewController.swift
//  LoadingAwebSiteWithWebKitView
//
//  Created by Carlos Santiago Cruz on 11/19/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let webURL = URL(string: "https://www.apple.com") {
            let request = URLRequest(url: webURL)
            webView.load(request)
        }

    }


}

