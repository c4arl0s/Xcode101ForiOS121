//
//  ViewController.swift
//  LoadingJSONfileFromYahoo
//
//  Created by Carlos Santiago Cruz on 11/19/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//  Loading a JSON file from Yahoo and converting the data JSON data

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let webURL = URL(string: "https://query.yahooapis.com/v1/public/yql?q=select%20item.condition%20from%20weather.forecast%20where%20woeid%20%3D%202487889&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys")
        let request = URLRequest(url: webURL!)
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, response, error) in
            if error == nil &&  data != nil {
                if let resp = response as? HTTPURLResponse {
                    let status = resp.statusCode
                    if status == 200 {
                        let content = String(data: data!, encoding: String.Encoding.ascii)
                        print(content!)
                        // read the data
                        self.getValues(jsonData: data!)
                    } else { print("Error")
                    }
                } else { print("Error")}
            }
        }
        // task to download data and then call the resume() method
        task.resume()
    }
    func getValues(jsonData: Data) {
        // the values provided by Yahoo are nested one inside another,
        // so we have to create several structures to represent them
        // we have defined the structures inside the method to simplify the example.
        
        struct Condition: Codable {
            let temp: String
            let text: String
            let date: Date
        }
        struct Item: Codable {
            let condition: Condition
        }
        struct Channel: Codable {
            let item: Item
        }
        struct Results: Codable {
            let channel: Channel
        }
        struct Query: Codable {
            let results: Results
        }
        struct JsonResults: Codable {
            let query: Query
        }
        
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE, dd MMMM yyyy h:mm a z"
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        do { let information = try decoder.decode(JsonResults.self, from: jsonData)
            print("whatch the console")
            print("Temperature: \(information.query.results.channel.item.condition.temp)")
            print("Condition: \(information.query.results.channel.item.condition.text)")
            print("Date: \(information.query.results.channel.item.condition.date)")
        } catch {
            print("Error")
        }
    }
}

