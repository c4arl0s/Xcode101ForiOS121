//
//  GreetingViewController.swift
//  MVCpattern
//
//  Created by Carlos Santiago Cruz on 25/10/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import UIKit

class GreetingViewController: UIViewController {
    var person: Person!
    let showGreetingButton = UIButton()
    let greetingLabel = UILabel()
    
    override func viewDidLoad() {
    super.viewDidLoad()
        self.showGreetingButton.addTarget(self, action: Selector(("didTapButton")), for: .touchUpOutside)
        let model = Person(firstName: "Carlos", lastName: "Santiago")
        let view = GreetingViewController()
        view.person = model
    }
    func didTapButton(button: UIButton) {
        let greeting = "hello" + " " + self.person.firstName + " " + self.person.lastName
        self.greetingLabel.text = greeting
    }
}
