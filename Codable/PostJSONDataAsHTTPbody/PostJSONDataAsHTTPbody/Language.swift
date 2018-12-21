//
//  Language.swift
//  PostJSONDataAsHTTPbody
//
//  Created by Carlos Santiago Cruz on 12/20/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import Foundation

struct Language {
    var name: String
    var version: Int
    
    func toDictionary() -> [String:Any] {
        return ["name":self.name, "version":self.version]
    }
    init(name: String, version: Int) {
        self.name = name
        self.version = version
    }
}
