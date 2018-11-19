//
//  ViewController.swift
//  LoadingARemoteDocument
//
//  Created by Carlos Santiago Cruz on 11/19/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//
//  Loading a remote Document

import UIKit
import Foundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let webURL = URL(string: "https://www.yahoo.com")
        let request = URLRequest(url: webURL!)
        let session = URLSession.shared
        // shared, this type property returs a standard session
        // with a configuration by default that is suitable to perform
        // basic requests.
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

