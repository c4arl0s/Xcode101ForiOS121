//
//  Address.swift
//  OptionalChaining
//
//  Created by Carlos Santiago Cruz on 12/9/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import Foundation

class Address {
    var buildingNumber: String
    var streetName: String
    var apartmentNumber: String?
    
    init(buildingNumber: String, streetName: String, apartmentNumber: String?) {
        self.buildingNumber = buildingNumber
        self.streetName = streetName
        self.apartmentNumber = apartmentNumber
    }
}
