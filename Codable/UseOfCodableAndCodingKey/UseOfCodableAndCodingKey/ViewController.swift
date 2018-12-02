//
//  ViewController.swift
//  UseOfCodableAndCodingKey
//
//  Created by Carlos Santiago Cruz on 12/1/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // ENCODE
        let jsonEncoder = JSONEncoder()
        do {
            let jsonData = try jsonEncoder.encode(upMovie)
            let jsonString = String(data: jsonData, encoding: .utf8)
            print(jsonString ?? "")
        } catch {}
    }
}

