//
//  ViewController.swift
//  FuncArrayMinMax
//
//  Created by Carlos Santiago Cruz on 12/23/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let array = [1,2,3,4,52,34,5,53,3,5,3,2,4,3,34,1]
        let minMaxObject = minMax(array: array)
        print(minMaxObject!)
        
    }
    func minMax(array: [Int]) -> (min: Int, max: Int)? {
        if array.isEmpty { return nil }
        var currentMin = array[0]
        var currentMax = array[0]
        for value in array[1..<array.count] {
            if value < currentMin {
                currentMin = value
            } else if value > currentMax {
                currentMax = value
            }
        }
        return (currentMin, currentMax)
    }

}

