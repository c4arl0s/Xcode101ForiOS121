//
//  ViewController.swift
//  UnderstandingDelegatesAndDelegation
//
//  Created by Carlos Santiago Cruz on 24/10/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import UIKit

class ViewController: UIViewController, LogoDownloaderDelegate {
    @IBOutlet weak var loadingLabel: UILabel!
    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    var logoDownloader: LogoDownloader?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // Initially, the image view is hidden so we can fade it in with animation.
        imageView.alpha = 0.0
        // Initially, the login area, with username and password, are hidden
        // until the logo image downloads, and then we fade it in.
        loginView.alpha = 0.0
        // NASA images used pursuant to https://www.nasa.gov/multimedia/guidelines/index.html
        let imageURL: String = "https://cdn.spacetelescope.org/archives/images/publicationjpg/heic1509a.jpg"
        // Construct a LogoDownloader to download the NASA file.
        logoDownloader = LogoDownloader(logoURL: imageURL)
        // Set a reference in the delegating object, LogoDownloader, to
        // this class, ViewController. ViewController is the delegate.
        // LogoDownloader tells ViewController that the image at the NASA
        // URL has downloaded by calling the delegate method
        // didFinishDownloading(_).
        logoDownloader?.delegate = self
        // Start the logo image download and get informed when it
        // finished downloading when didFinishDownloading(_) is called.
        logoDownloader?.downloadLogo()
        // Since the delegating object, LogoDownloader, has an optional
        // reference to this class, ViewController, that reference can
        // be nil, and since we use optional chaining, ViewController
        // can run with or without the delegating object.
        if logoDownloader?.delegate == nil {
            loginView.alpha = 1.0
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // Defining this method makes ViewController conform/adopt
    // the LogoDownloaderDelegate protocol. This method is called
    // when the logo image finished downloading.
    func didFinishDownloading(_ sender: LogoDownloader) {
        imageView.image = logoDownloader?.image
        // Animate the appearance of this ViewController's
        // user interface.
        UIView.animate(withDuration: 2.0, delay: 0.5, options: UIViewAnimationOptions.curveEaseIn, animations:  {
            self.loadingLabel.alpha = 0.0
            self.imageView.alpha = 1.0
        }) { (completed: Bool) in
            if (completed) {
                UIView.animate(withDuration: 2.0) {
                    self.loginView.alpha = 1.0
                }
            }
        }
    } // end func didFinishDownloading
    }



