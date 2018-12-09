//
//  DataModel.swift
//  PassingDataFromModelToController
//
//  Created by Carlos Santiago Cruz on 23/10/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import Foundation
import UIKit

protocol DataModelDelegate: class {
    func didRecieveDataUpdate(data: String)
}

class DataModel {
    weak var delegate: DataModelDelegate?
    // code
    // code
    // code
    func requestData() {
        // the data was received and parsed to String
        let data = "this is a pice of data from Class DataModel"
        delegate?.didRecieveDataUpdate(data: data)
    }
}
