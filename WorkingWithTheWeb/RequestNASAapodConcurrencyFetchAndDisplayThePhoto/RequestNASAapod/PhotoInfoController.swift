//
//  PhotoInfoController.swift
//  RequestNASAapod
//
//  Created by Carlos Santiago Cruz on 11/22/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import Foundation
import UIKit

class PhotoInfoController {
    
    func fetchPhotoInfo(completion: @escaping (PhotoInfo?) -> Void) {
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
            } else {
                print("ERROR: either no data was return, or data was not property decoded")
                completion(nil)
            }
        }
        task.resume()
    }

    

}
