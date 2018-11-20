//
//  ViewController.swift
//  InstantiatingACustomSession
//
//  Created by Carlos Santiago Cruz on 11/19/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
// Instantiating a custom session and following a redirection.

// some websites like google send the user to a different address that contain a version
// of a website customized according to the users location or preferences.

import UIKit

class ViewController: UIViewController, URLSessionTaskDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        let webURL = URL(string: "https://www.google.com")
        let request = URLRequest(url: webURL!)
        // this initializer creates a new session with the configuration set by its attribute.
        // The configuration atribute is an object that specifies the session's behaviour
        // A default session configuration object.
        let configuration = URLSessionConfiguration.default
        // A Boolean value that indicates whether the session should wait for connectivity to become available, or fail immediately.
        configuration.waitsForConnectivity = true
        // we can define a custom session with a delegate and then implement the method of the
        // URLSessionTaskDelegate protocol to determine what we want to do when the server is redirecting.
        let session = URLSession(configuration: configuration, delegate: self, delegateQueue: nil)
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
    // every time the server asks for a redirection, the protocol method is called and the request
    // with the new URL is executed. The process repeats until the final destination is reached
    // and then the content of that document is again printed on the console.
    
    // urlSession() method is called on the delegate when the server redirected the connection to another URL.
    // Our implementation must call the completion handler received by the method with an attribute
    // that defines the new request ( the value of the newRequest attribute) or
    // the value nil if we do not want to follow the redirection.
    
    func urlSession(_ session: URLSession,
                    task: URLSessionTask,
                    willPerformHTTPRedirection response: HTTPURLResponse,
                    newRequest request: URLRequest,
                    completionHandler: @escaping (URLRequest?) -> Void) {
        completionHandler(request)
    }
}
