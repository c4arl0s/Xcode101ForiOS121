//
//  Country.swift
//  Worldb
//
//  Created by Luis Ezcurdia on 9/29/18.
//  Copyright © 2018 Luis Ezcurdia. All rights reserved.
//

import Foundation

struct Country: Codable {
    let id: Int
    let name: String
    let iso: String
    let languages: [String]
}
