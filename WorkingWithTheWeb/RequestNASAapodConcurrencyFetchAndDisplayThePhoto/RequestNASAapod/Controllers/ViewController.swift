//
//  ViewController.swift
//  RequestNASAapod
//
//  Created by Carlos Santiago Cruz on 11/20/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    @IBOutlet weak var todaysPhoto: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var copyRightLabel: UILabel!
    
    let photoInfoController = PhotoInfoController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        photoInfoController.fetchPhotoInfo { (fetchedInfo) in
            if let fetchedInfo = fetchedInfo {
                DispatchQueue.main.async {
                    self.title = fetchedInfo.title
                    self.descriptionLabel.text = fetchedInfo.description
                    if let copyRight = fetchedInfo.copyright {
                        self.copyRightLabel.text = "Copyright: \(copyRight)"
                        }   else { self.copyRightLabel.isHidden = true
                    }
                    self.updateUI(with: fetchedInfo)
                    
                }
            }
        }
    }
    
    
    func updateUI(with photoInfo: PhotoInfo) {
        let task = URLSession.shared.dataTask(with: photoInfo.url) { (data, response, error) in
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.title = photoInfo.title
                    self.todaysPhoto.image = image
                    self.descriptionLabel.text = photoInfo.description
                    if let copyright = photoInfo.copyright {
                        self.copyRightLabel.text = "Copyright \(copyright)"
                    } else { self.copyRightLabel.isHidden = true }
                }
            }
        }
        task.resume()
    }
}


