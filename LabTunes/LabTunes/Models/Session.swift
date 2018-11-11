//
//  Session.swift
//  LabTunes
//
//  Created by Carlos Santiago Cruz on 09/11/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import Foundation

class Session: NSObject {
    var token: String?
    // we guarantee the singleton
    static let sharedInstance = Session()
    
    override private init() {
        super.init()
    }
    
    func SaveSession() {
        token = "1234567890"
    }
}
