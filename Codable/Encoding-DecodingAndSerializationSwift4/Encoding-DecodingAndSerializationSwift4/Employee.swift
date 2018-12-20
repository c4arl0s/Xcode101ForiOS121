//
//  Employee.swift
//  Encoding-DecodingAndSerializationSwift4
//
//  Created by Carlos Santiago Cruz on 12/19/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import Foundation

struct Employee: Codable {
    var name: String
    var id: Int
    var favoriteTool: Tool
}
struct Tool: Codable {
    var name: String
}
