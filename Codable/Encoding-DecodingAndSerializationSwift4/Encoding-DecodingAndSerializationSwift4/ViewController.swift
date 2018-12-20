//
//  ViewController.swift
//  Encoding-DecodingAndSerializationSwift4
//
//  Created by Carlos Santiago Cruz on 12/19/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let toy1 = Toy(name: "Teddy Bear")
        let employee1 = Employee(name: "John Appleseed", id: 7, favoriteToy: toy1)
        //create an instance let jsonEncoder = JSONEncoder()
        let jsonEncoder = JSONEncoder()
        let jsonData = try? jsonEncoder.encode(employee1)
        // Use String initializer
        let jsonString = String(data: jsonData!, encoding: .utf8)
        print(jsonString!)
        let jsonDecoder = JSONDecoder()
        let employee2 = try? jsonDecoder.decode(Employee.self, from: jsonData!)
        print(employee2!)
        
    }


}

