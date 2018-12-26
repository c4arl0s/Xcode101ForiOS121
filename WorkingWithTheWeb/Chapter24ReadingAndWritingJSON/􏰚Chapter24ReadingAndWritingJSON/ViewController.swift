//
//  ViewController.swift
//  􏰚Chapter24ReadingAndWritingJSON
//
//  Created by Carlos Santiago Cruz on 12/25/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            guard let jsonData = "[\"Hello\",\"JSON\"]".data(using: .utf8) else {
                fatalError("I could not encode string as UTF8")
            }
            let jsonObject = try JSONSerialization.jsonObject(with: jsonData, options: [])
            if let stringArray = jsonObject as? [String] {
                print("Got array of strings: \(stringArray.joined(separator: ", "))")
            }
        } catch {
            print("error reading JSON: \(error)")
        }
    }


}

