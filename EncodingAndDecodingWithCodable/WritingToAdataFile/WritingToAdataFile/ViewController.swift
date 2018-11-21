//
//  ViewController.swift
//  WritingToAdataFile
//
//  Created by Carlos Santiago Cruz on 11/20/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//  Writing to a Data File after encoding an instance of Note

// aplications are given access to read and write files anywhere on the disk
// some operating systems introduce the concept of sandboxing
// iOS apps work in the sandbox model

// the Foundation Framework defines a FileManager class

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // create an instance of note
        let newNote = Note(title: "new note", text: "this is a new note", timestamp: Date())
        
        // now create an instance of FileManager
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let archiveURL = documentsDirectory.appendingPathComponent("notes_test").appendingPathExtension("plist")
        
        // first encoding
        let propertyListEncoder = PropertyListEncoder()
        let encodedNote = try? propertyListEncoder.encode(newNote)
        
        // now try to save the encodedNote to archiveURL with noFileProtection Option
        try? encodedNote?.write(to: archiveURL, options: .noFileProtection)
        
        // now create an instance of PropertyListDecoder to decode the saved info
        // let retrievedNoteData and let decodedNote from retrievedNoteData
        // if true, print decodedNote
        let propertyListDecoder = PropertyListDecoder()
        if let retrievedNoteData = try? Data(contentsOf: archiveURL),
            let decodedNote = try? propertyListDecoder.decode(Note.self, from: retrievedNoteData) {
            print(decodedNote)
            print("you have successifully encoded, saved, loaded, and decoded your Note Instance")
        }
        }
    }


