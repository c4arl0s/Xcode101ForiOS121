//
//  PhotoInfo.swift
//  RequestNASAapod
//
//  Created by Carlos Santiago Cruz on 11/20/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import Foundation

struct PhotoInfo: Codable {
    var title: String
    var description: String
    var url: URL
    var copyright: String?
    
    enum CodingKeys: String, CodingKey {
        case title
        case description = "explanation"
        case url
        case copyright
    }
    
    // initializar
    // throws indicates that this initializer is a thowing function
    // this function is called by the decoder that you use to decode your JSON data, so errors will be handled by
    // the Decoder object or passed along when you call the decode(_:from:) method.
    
    init(from decoder: Decoder) throws {
        // func container() Returns the data stored in this decoder as
        // represented in a container keyed by the given key type. [Key: Any]
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        
        self.title = try valueContainer.decode(String.self, forKey: CodingKeys.title)
        self.description = try valueContainer.decode(String.self, forKey: CodingKeys.description)
        self.url = try valueContainer.decode(URL.self, forKey: CodingKeys.url)
        self.copyright = try? valueContainer.decode(String.self, forKey: CodingKeys.copyright)
    }
    // inside the initializer you need to access the JSON data's key/value pairs through decoder
    // You first do this by accessing a keyedCodingContainer, which acts much like a dictionary
    // Do this with the code let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
    // this will return a keyedCodingContainer that only contains the key/value pairs associted with
    // the cases declared in CodingKeys.
    
    
    
    
}
