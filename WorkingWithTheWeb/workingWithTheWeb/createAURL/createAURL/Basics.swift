//
//  Basics.swift
//  createAURL
//
//  Created by Carlos Santiago Cruz on 27/09/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import Foundation
import PlaygroundSupport

// create a URL
let url = URL(string: "https://www.apple.com")!

// Create a Network Request
let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
    if let data = data {
    print(data)
    }
}

// Send the Request
task.resume()
// Generally, this is all you need to start a network request.
// once you understand syncrnous and asyncronous.
// at this point you have to add import PlaygroundSupport at the top of the file
