//
//  Language.swift
//  CreatingSerializableProtocol
//
//  Created by Carlos Santiago Cruz on 12/20/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import Foundation

struct Language: Serializable {
    var name: String
    var version: Int
    
    init(name: String, version: Int) {
        self.name = name
        self.version = version
    }
    func serialize() -> String? {
        let encoder = JSONEncoder()
        let encoded = try? encoder.encode(self)
        let encodedString = String(data: encoded!, encoding: .utf8)
        return encodedString
    }
}


