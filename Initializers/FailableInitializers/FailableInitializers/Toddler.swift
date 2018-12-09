//
//  Toddler.swift
//  FailableInitializers
//
//  Created by Carlos Santiago Cruz on 12/9/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import Foundation

struct Toddler {
    var name: String
    var monthsOld: Int
    
    // you can define a failable initializer
    // that question mark (?) tells swift that this initializer may return nil
    // and that it should return an instance of type Toddler?
    
    init?(name: String, monthsOld: Int) {
        if monthsOld < 12 || monthsOld > 36 {
            return nil
        } else {
            self.name = name
            self.monthsOld = monthsOld
        }
    }
}
