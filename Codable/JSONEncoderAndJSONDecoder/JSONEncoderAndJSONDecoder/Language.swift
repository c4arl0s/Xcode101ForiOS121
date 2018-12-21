//
//  Language.swift
//  JSONEncoderAndJSONDecoder
//
//  Created by Carlos Santiago Cruz on 12/20/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import Foundation

struct Language: Codable {
    var name: String
    var version: Int
    
    init(name: String, version: Int) {
        self.name = name
        self.version = version
    }
}
