//
//  Note.swift
//  WritingToAdataFile
//
//  Created by Carlos Santiago Cruz on 11/20/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import Foundation

struct Note: Codable {
    let title: String
    let text: String
    let timestamp: Date
}
