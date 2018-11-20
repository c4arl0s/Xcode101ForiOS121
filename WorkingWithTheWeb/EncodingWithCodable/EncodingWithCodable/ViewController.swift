//
//  ViewController.swift
//  EncodingWithCodable
//
//  Created by Carlos Santiago Cruz on 11/19/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//  Codable is a protocol that allows classes and structures to be encoded to o decoded from different types of data such as JASON or plist.
// The Codable Protocol declares two methods that a Class must implement so that its instances can be encoded and decoded, or seriealize, into data that can be written to a file on disk.
// plist format is similar to a representation of a Dictionary in a file that can be saved to disk.

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let newNote = Note(title: "new note", text: "this is a new note", timestamp: Date())
        // now look at the following example to see how to use encoder object to encode a value to a plist.
        let propertyListEncoder = PropertyListEncoder()
        if let encodableNote = try? propertyListEncoder.encode(newNote) {
            print(encodableNote)
            print("it prints the number of bytes stored in the Data Object")
        }
    }


}

