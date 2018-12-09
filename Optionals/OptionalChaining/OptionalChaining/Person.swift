//
//  Person.swift
//  OptionalChaining
//
//  Created by Carlos Santiago Cruz on 12/9/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import Foundation

class Person {
    var age: Int
    var residence: Residence?
    
    init(age: Int, residence: Residence?) {
        self.age = age
        self.residence = residence
    }
}
