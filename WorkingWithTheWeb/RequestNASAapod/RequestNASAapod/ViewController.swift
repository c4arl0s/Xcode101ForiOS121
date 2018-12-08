//
//  ViewController.swift
//  RequestNASAapod
//
//  Created by Carlos Santiago Cruz on 11/20/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    @IBOutlet weak var sizeLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //urlSessionAndDecodeApiNASA()
        //urlSessionApiNASA()
        
        fetchPhotoInfo { (fetchedInfo) in
            print(fetchedInfo)
        }
        
    }
    func urlSessionApiNASA() {
        // this function just make a request to nasa api
        let baseURL = URL(string: "https://api.nasa.gov/planetary/apod")!
        let query: [String: String] = ["api_key": "DEMO_KEY"]
        let url = baseURL.withQueries(query)!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data, let string = String(data: data, encoding: .utf8) {
                print(string)
            }
        }
        task.resume()
    }
    func urlSessionAndDecodeApiNASA() {
        // this function just make a request to nasa api and decode de data into a dictionary
        let baseURL = URL(string: "https://api.nasa.gov/planetary/apod")!
        let query: [String: String] = ["api_key": "DEMO_KEY"]
        let url = baseURL.withQueries(query)!
        let task = URLSession.shared.dataTask(with: url) { (data,response,error) in
            let jsonDecoder = JSONDecoder()
            if let data = data,
                let photoDictionary = try? jsonDecoder.decode([String:String].self, from: data) {
                print(photoDictionary)
            }
        }
        task.resume()
    }
    // You cannot return an object from within the completion handler
    // the request runs asynchronously, which means it runs on a background queu
    // when the network request is completed, the URLSession instance executes your block of code.
    
    // just like the developer who wrote code for the URLSession class, you too can write code that
    // takes a competion handler and executes it after a long-running operation is completed.
    
    // example:
    // func performLongRunningOperation(completion: @escaping () -> Void) {
    // code that performs a long running operation
    // completion()
    // }
    
    func fetchPhotoInfo(completion: @escaping (PhotoInfo) -> Void) {
        // this function just make a request to nasa api and decode the data into a dictionary
        // so it is not executed in line with the rest of the code.
        let baseURL = URL(string: "https://api.nasa.gov/planetary/apod")!
        let query: [String: String] = ["api_key": "DEMO_KEY"]
        let url = baseURL.withQueries(query)!
        let task = URLSession.shared.dataTask(with: url) { (data,response,error) in
            // this happens after the network request is complete.
            let jsonDecoder = JSONDecoder()
            if let data = data, let photoInfo = try? jsonDecoder.decode(PhotoInfo.self, from: data) {
                completion(photoInfo)
                    // you have to display the data into main tread
                    DispatchQueue.main.async {
                        self.sizeLabel.text = "\(data.count) bytes downloaded"
                    }
            } else {
                print("ERROR: either no data was return, or data was not property decoded")
            }
        }
        task.resume()
    }
}

