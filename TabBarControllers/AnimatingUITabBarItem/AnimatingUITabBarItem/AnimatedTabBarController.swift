//
//  AnimatedTabBarController.swift
//  AnimatingUITabBarItem
//
//  Created by Carlos Santiago Cruz on 29/10/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import UIKit

class AnimatedTabBarController: UITabBarController {
    var secondItemImageView: UIImageView!
    var firstItemView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
        let index = self.tabBar.items?.index(of: item)
        let subView = tabBar.subviews[index!+1].subviews.first as! UIImageView
        self.performSpringAnimation(imgView: subView)
    }
    //func to perform spring animation on imageview
    func performSpringAnimation(imgView: UIImageView) {
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
            
            imgView.transform = CGAffineTransform.init(scaleX: 1.4, y: 1.4)
            
            //reducing the size
            UIView.animate(withDuration: 0.5, delay: 0.2, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
                imgView.transform = CGAffineTransform.init(scaleX: 1, y: 1)
            }) { (flag) in
            }
        }) { (flag) in
            
        }
    }  
}
