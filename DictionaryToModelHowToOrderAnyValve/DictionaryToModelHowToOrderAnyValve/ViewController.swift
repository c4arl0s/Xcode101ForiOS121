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
        namesOfIntegers[16] = "sixteen" // namesOfIntegers now contains 1 key-value pair
        namesOfIntegers = [:]  // // namesOfIntegers is once again an empty dictionary of type [Int: String]
    }


}

