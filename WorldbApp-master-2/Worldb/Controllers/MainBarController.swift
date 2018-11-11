//
//  MainBarController.swift
//  Worldb
//
//  Created by Luis Ezcurdia on 9/29/18.
//  Copyright © 2018 Luis Ezcurdia. All rights reserved.
//

import UIKit

class MainBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadTheme()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func loadTheme() {
        if UserDefaults.standard.bool(forKey: "nightTheme"){
            self.tabBar.backgroundColor = UIColor.darkBlue
            self.tabBar.tintColor = UIColor.aqua
        } else {
            self.tabBar.backgroundColor = UIColor.morningLight
            self.tabBar.tintColor = UIColor.darkBlue
        }
    }
}
