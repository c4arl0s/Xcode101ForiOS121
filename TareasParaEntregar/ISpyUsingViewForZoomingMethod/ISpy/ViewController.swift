//
//  ViewController.swift
//  ISpy
//
//  Created by Carlos Santiago Cruz on 06/09/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import UIKit

// 1st - Use the protocol UIScrollViewDelegate
class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var ScrollViewOutlet: UIScrollView!
    
    @IBOutlet weak var imageViewOutlet: UIImageView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // 2nd - In the viewDidLoad() method, set the scroll view's delegate to be the ViewController instance.
        // ScrollViewOutlet.delegate = self links the view controller with the scroll view object.
        // scroll view use the delegates functions provided by the view controller like viewForZooming.
        ScrollViewOutlet.delegate = self
        // if you want to remember the explanation back to see Scroll Views in iOs11
    }
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
    // 3rd - this method is called by the Scroll View on its delegate to know
    // which view on its content is going to be zoomed in or out
    return imageViewOutlet
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

