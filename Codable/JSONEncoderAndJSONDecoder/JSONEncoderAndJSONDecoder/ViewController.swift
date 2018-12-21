//
//  ViewController.swift
//  JSONEncoderAndJSONDecoder
//
//  Created by Carlos Santiago Cruz on 12/20/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let language = Language(name: "swift", version: 4)
        
        // Encoding the instance
        let encoder = JSONEncoder()
        let encoded = try? encoder.encode(language)
        let encodedString = String(data: encoded!, encoding: .utf8)
        print(encodedString!)
        
        // Decoding the instance
        let decoder = JSONDecoder()
        let decoded = try? decoder.decode(Language.self, from: encoded!)
        print(decoded!)
        
    }


}

