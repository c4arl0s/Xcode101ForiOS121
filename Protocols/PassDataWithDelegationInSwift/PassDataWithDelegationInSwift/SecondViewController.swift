//
//  SecondViewController.swift
//  PassDataWithDelegationInSwift
//
//  Created by Carlos Santiago Cruz on 03/11/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import UIKit

protocol PassDataDelegate {
    func finishPassingData(string: String)
}

class SecondViewController: UIViewController {
    var delegate: PassDataDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func passDataButtonTapped(_ sender: Any) {
        delegate?.finishPassingData(string: "Send from SecondViewController")
    }

}
