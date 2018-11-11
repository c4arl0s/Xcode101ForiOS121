//
//  Person.swift
//  howDoesMVCpatternWorks
//
//  Created by Carlos Santiago Cruz on 03/10/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//  MODEL Person    

import UIKit

class Person: NSObject {
    let name: String?
    let lastName: String?
    let phoneNumber: Int?
    init(name: String?, lastName: String?, phoneNumber: Int? ) {
        self.name = name
        self.lastName = lastName
        self.phoneNumber = phoneNumber
    }

}
