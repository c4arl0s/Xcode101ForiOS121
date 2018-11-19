//
//  ViewController.swift
//  ImplementingCustomeWebBrowser
//
//  Created by Carlos Santiago Cruz on 11/19/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var fordwardButton: UIBarButtonItem!
    @IBOutlet weak var refreshButton: UIBarButtonItem!
    @IBOutlet weak var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        backButton.isEnabled = false
        fordwardButton.isEnabled = false
        webView.navigationDelegate = self
        if let webURL = URL(string: "https://www.apple.com/mx/") {
            let request = URLRequest(url: webURL)
            webView.load(request)
        }
    }
    @IBAction func backButtonTapped(_ sender: UIBarButtonItem) {
        webView.goBack()
    }
    @IBAction func fordwardButtonTapped(_ sender: UIBarButtonItem) {
        webView.goForward()
    }
    @IBAction func refreshButtonTapped(_ sender: UIBarButtonItem) {
        webView.reload()
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        backButton.isEnabled = webView.canGoBack
        fordwardButton.isEnabled = webView.canGoForward
        
    }
}

