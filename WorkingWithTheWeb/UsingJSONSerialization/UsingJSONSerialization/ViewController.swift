//
//  ViewController.swift
//  UsingJSONSerialization
//
//  Created by Carlos Santiago Cruz on 12/23/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let str = "{\"names\": [\"Bob\", \"Tim\", \"Tina\"]}"
        let data = str.data(using: String.Encoding.utf8, allowLossyConversion: false)!
        // do catch
        do {
            let jsonDictionary = try JSONSerialization.jsonObject(with: data, options: []) as! [String: AnyObject]
            if let names = jsonDictionary["names"] as? [String] {
                print(names)
            }
        } catch let error as NSError {
            print("Failed to load: \(error.localizedDescription)")
        }
    
        let jsonDictionary = [
            "name" : "Swift",
            "developer" : "Apple Inc.",
            "releaseDate" : [ "format":"longStyle", "date": "June 2, 2014" ],
            "typing" : ["static", "strong", "inferred"],
            "OS" : ["Mac OS", "Linux", "FreeBSD"],
            "license" : "Apache License 2.0",
            "website" : "swift.org" ] as [String : Any]
        if JSONSerialization.isValidJSONObject(jsonDictionary) {
            if (try? JSONSerialization.data(withJSONObject: jsonDictionary, options: [])) != nil {
                print("JSON data object is: \(data)")
            }
        }
        
        // Reading JSON Objects
        let jsonObject = try? JSONSerialization.jsonObject(with: data, options: [])
        if let dictionary = jsonObject as? [String: Any],
            let name = dictionary["name"],
            let developer = dictionary["developer"],
            let typing = dictionary["typing"],
            let website = dictionary["website"] {
            // treat it as a string key dictionary.
            print("language name: \(name)")
            print("language developer: \(developer)")
            print("language typing: \(typing)")
            print("language website: \(website)")
        } else{ print("I couldnt extract the constants")}
    }
}
