//
//  LogoDownloader.swift
//  UnderstandingDelegatesAndDelegation
//
//  Created by Carlos Santiago Cruz on 24/10/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import Foundation
import UIKit

protocol LogoDownloaderDelegate {
    // Classes that adopt this protocol MUST define
    // this method -- and hopefully do something in
    // that definition.
    func didFinishDownloading(_ sender: LogoDownloader)
}
class LogoDownloader {
    
    var logoURL:String
    var image:UIImage?
    
    // weak var delegate:LogoDownloaderDelegate?
    // SEE NOTE BELOW
    var delegate: LogoDownloaderDelegate?
    
    init(logoURL:String) {
        self.logoURL = logoURL
    }
    
    func downloadLogo() {
        // Start the image download task asynchronously by submitting
        // it to the default background queue; this task is submitted
        // and DispatchQueue.global returns immediately.
        DispatchQueue.global(qos: DispatchQoS.QoSClass.default).async {
            // I'm PURPOSEFULLY downloading the image using a synchronous call
            // (NSData), but I'm doing so in the BACKGROUND.
            let imageURL = URL(string: self.logoURL)
            let imageData = NSData(contentsOf: imageURL!)
            self.image = UIImage(data: imageData! as Data)
            print("image downloaded")
            // Once the image finishes downloading, I jump onto the MAIN
            // THREAD TO UPDATE THE UI.
            DispatchQueue.main.async {
                // Tell the delegate that the image
                // has downloaded so the delegate can
                // display the image.
                self.didDownloadImage()
            }
            
        } // end DispatchQueue.global
    }
    
    // Since this class has a reference to the delegate,
    // "at the appropriate time [it] sends a message to" the delegate.
    // Finishing the logo download is definitely
    // the appropriate time.
    func didDownloadImage() {
        delegate?.didFinishDownloading(self)
    }
    
} // end class LogoDownloader

