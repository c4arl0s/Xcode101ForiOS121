//
//  ViewController.swift
//  CodingKeyProtocol-CodingKeysEnum
//
//  Created by Carlos Santiago Cruz on 12/19/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let tool1 = Tool(name: "Hammer");
        let employee1 = Employee(name: "Carlos Santiago", id: 19, favoriteTool: tool1)
        print(employee1)
        let jsonEnconder = JSONEncoder()
        let jsonData = try? jsonEnconder.encode(employee1)
        let jsonString = String(data: jsonData!, encoding: .utf8)
        // note that the property id, now is employeeid
        print(jsonString!)
        
    }


}

