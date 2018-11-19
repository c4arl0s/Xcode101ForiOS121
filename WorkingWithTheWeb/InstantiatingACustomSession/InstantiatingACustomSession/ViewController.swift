//
//  ViewController.swift
//  InstantiatingACustomSession
//
//  Created by Carlos Santiago Cruz on 11/19/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let webURL = URL(string: "https://www.yahoo.com")
        let request = URLRequest(url: webURL!)
        // this initializer creates a new session with the configuration set by its attribute.
        // The configuration atribute is an object that specifies the session's behaviour
        // A default session configuration object.
        let configuration = URLSessionConfiguration.default
        // A Boolean value that indicates whether the session should wait for connectivity to become available, or fail immediately.
        configuration.waitsForConnectivity = true
        let session = URLSession(configuration: configuration)
        let task = session.dataTask(with: request) { (data, response, error) in
            if error == nil &&  data != nil {
                if let resp = response as? HTTPURLResponse {
                    let status = resp.statusCode
                    if status == 200 {
                        // we turn the data into a string with the String() initializer
                        // and then print the string on the console
                        let content = String(data: data!, encoding: String.Encoding.ascii)
                        print(content!)
                    } else { print("Error")
                    }
                } else { print("Error")}
            }
        }
        // task to download data and then call the resume() method
        task.resume()
    }
}

