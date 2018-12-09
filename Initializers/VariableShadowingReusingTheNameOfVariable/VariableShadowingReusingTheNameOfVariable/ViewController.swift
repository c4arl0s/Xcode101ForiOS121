//
//  ViewController.swift
//  VariableShadowingReusingTheNameOfVariable
//
//  Created by Carlos Santiago Cruz on 12/9/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var name: String? = "Brady"

    override func viewDidLoad() {
        super.viewDidLoad()
        // you can re-name the variable name.
        if let name = name {
            print("\(name)")
        }
        // notice that you can use the implicit property self
        if let name = self.name {
            print("\(name)")
        }
        exclaim(name: "Carlos")
        exclaimUsingGuardLet(name: "Norma")
    }
    func exclaim(name: String?) {
        if let name = name {
            print("Exclaim function was passed: \(name)")
        }
    }
    func exclaimUsingGuardLet(name: String?) {
        guard let name = name else { return }
        print("Exclaim function was passed: \(name)")
    }
}

