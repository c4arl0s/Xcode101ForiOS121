//
//  ViewController.swift
//  DictionaryToModelHowToOrderAnyValve
//
//  Created by Carlos Santiago Cruz on 12/22/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // Creating an Empty Dictionary
    var namesOfIntegers = [Int: String]()
    // Creating a Dictionary with a Dictionary Literal
    var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
    var nomenclature: [String: String] = ["60HP": "High pressure"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // namesOfIntegers now contains 1 key-value pair
        namesOfIntegers[16] = "sixteen"
        // namesOfIntegers is once again an empty dictionary of type [Int: String]
        print(namesOfIntegers)
        // append another element
        namesOfIntegers[10] = "ten"
        print(namesOfIntegers)
        namesOfIntegers[11] = "eleven"
        print(namesOfIntegers)
        airports["MX"] = "Mexico City"
        print(airports)
        
        for (airportCode, airportName) in airports {
            print("\(airportCode): \(airportName)")
        }
        for airportCode in airports.keys {
            print("Airport code: \(airportCode)")
        }
        for airportName in airports.values {
            print("Airport name: \(airportName)")
        }
        let airportCodes = [String](airports.keys)
        print(airportCodes)
        let airportNames = [String](airports.values)
        print(airportNames)
    }


}

