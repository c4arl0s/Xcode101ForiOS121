//
//  Fish.swift
//  plasticFishesMVC
//
//  Created by Carlos Santiago Cruz on 14/09/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import Foundation

struct Fish {
    let id: Int
    let name: String
    let text: String
    let apiURLString: String
    let webURLString: String
    let imageURLString: String
    var apiURL: URL? {
        return URL(String: apiURLString)
    }
    var webURL: URL? {
        return URL(String: webURLString)
    }
    var imageURL: Data? {
        
    }
}
