//
//  SettingsViewController.swift
//  Worldb
//
//  Created by Luis Ezcurdia on 9/29/18.
//  Copyright © 2018 Luis Ezcurdia. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var themeSwitch: UISwitch!
    
    @IBAction
    func changeTheme(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "nightTheme")
        loadTheme()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        themeSwitch.isOn = UserDefaults.standard.bool(forKey: "nightTheme")
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
            self.view.backgroundColor = UIColor.darkBlue
        } else {
            self.view.backgroundColor = UIColor.morningLight
        }
    }
}
