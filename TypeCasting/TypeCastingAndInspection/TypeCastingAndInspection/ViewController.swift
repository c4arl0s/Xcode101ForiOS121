//
//  ViewController.swift
//  TypeCastingAndInspection
//
//  Created by Carlos Santiago Cruz on 12/9/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // when you dive into building apps you will discover that, when working with UIKit, the APIs can return very generic obkjects, such as UIViewController. But as the developer of your application, you know what the specific type should be.
    
    // for example, if pressing a button on the view of FirstViewController always presents a SecondViewController, you can force the downcast of destination to SecondViewController within the prepare(for segue:) function. This function is called whenever you present a new view controller.
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let secondViewController = segue.destination as? SecondViewController {
        secondViewController.names = ["Carlos","Norma","Trinidad"]
    } else { print("casting failed") }
    }
    @IBAction func buttonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "goToSVC", sender: sender)
    }
}

