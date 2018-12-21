//
//  ViewController.swift
//  CreatingSerializableProtocol
//
//  Created by Carlos Santiago Cruz on 12/20/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import UIKit

protocol Serializable: Codable {
    func serialize() -> String?
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let language = Language(name: "swift", version: 4)
        let data = language.serialize()
        print(data!)
    }
}



