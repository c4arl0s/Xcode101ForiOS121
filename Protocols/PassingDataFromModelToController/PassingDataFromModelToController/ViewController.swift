//
//  ViewController.swift
//  PassingDataFromModelToController
//
//  Created by Carlos Santiago Cruz on 23/10/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import UIKit

class ViewController: UIViewController, DataModelDelegate {

    private let dataModel = DataModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        dataModel.delegate = self
        // code
        // code
        dataModel.requestData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    func didRecieveDataUpdate(data: String) {
        print(data)
    }
}

