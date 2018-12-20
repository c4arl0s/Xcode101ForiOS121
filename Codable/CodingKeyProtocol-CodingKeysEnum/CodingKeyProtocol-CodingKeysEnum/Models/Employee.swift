//
//  Employee.swift
//  CodingKeyProtocol-CodingKeysEnum
//
//  Created by Carlos Santiago Cruz on 12/19/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import Foundation

// Renaming Properties With CodingKeys

struct Employee: Codable {
    var name: String
    var id: Int
    var favoriteTool: Tool

    //  lets you rename specific properties in case the serialized format doesn’t match the requirements of the API.
    
    enum CodingKeys: String, CodingKey {
        case id = "employeeId"
        case name
        case favoriteTool = "favorite-tool"
    }
}

struct Tool: Codable {
    var name: String
}

//CodingKeys is a nested enumeration in your type.
//It has to conform to CodingKey.
//You also need String as the raw type, since the keys are always strings.
//You have to include all properties in the enumeration, even if you don’t plan to rename them.
//By default, this enumeration is created by the compiler, but when you need to rename a key you need to implement it yourself.
