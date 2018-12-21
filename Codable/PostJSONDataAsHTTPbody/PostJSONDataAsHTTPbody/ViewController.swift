//
//  ViewController.swift
//  PostJSONDataAsHTTPbody
//
//  Created by Carlos Santiago Cruz on 12/20/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let language = Language(name: "swift", version: 4)
        // The JSONSerialization class is responsible for returning a Data object, which can then be passed as an HTTPBody to a request.
        let data = try? JSONSerialization.data(withJSONObject: language.toDictionary(), options: [])
        let dataString = String(data: data!, encoding: .utf8)
        print(dataString!)
    }


}

