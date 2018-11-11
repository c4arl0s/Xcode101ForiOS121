//
//  FlickrAPI.swift
//  WebServicePhotoramaApp
//
//  Created by Carlos Santiago Cruz on 20/10/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import Foundation

enum Method: String {
    case interestingPhotos = "flickr.interestingness.getList"
}
struct FlickrAPI {
    // A type-level property (or method) is one that is accessed on the type itself – in this case, the FlickrAPI type. For structs, type properties and methods are declared with the static keyword; classes use the class keyword. You used a type method on the UIView class in Chapter 8 when you called the animate(withDuration:animations:) method. You also used a type method on UIImagePickerController in Chapter 15 when you called the isSourceTypeAvailable(_:) method. Here, you are declaring a type-level property on FlickrAPI.
    // The baseURLString is an implementation detail of the FlickrAPI type, and no other type needs to know about it. Instead, they will ask for a completed URL from FlickrAPI. To keep other files from being able to access baseURLString, mark the property as private.
    private static let baseURLString = "https://api.flickr.com/services/rest"
    private static func flickrURL(method: Method, parameters: [String:String]?) -> URL {
        var components = URLComponents(string: baseURLString)!
        var queryItems = [URLQueryItem]()
        let baseParams = [
            "method": method.rawValue,
            "format": "json",
            "nojsoncallback": "1",
            "api_key": apiKey
        ]
        for (key, value) in baseParams {
            let item = URLQueryItem(name: key, value: value)
            queryItems.append(item)
        }

        if let additionalParams = parameters {
            for (key, value) in additionalParams {
                let item = URLQueryItem(name: key, value: value)
                queryItems.append(item)
            }
        }
        components.queryItems = queryItems
        return components.url!
    }
    static var interestingPhotosURL: URL {
        return flickrURL(method: .interestingPhotos, parameters: ["extras": "url_h,date_taken"])
    }
    private static let apiKey = "97eba4acf9b649f39e9b754ea06af3ae"
}

// This is called access control. You can control what can access the properties and methods on your own types. There are five levels of access control that can be applied to types, properties, and methods:
// open – This is used only for classes, and mostly by framework or third-party library authors. Anything can access this class, property, or method. Additionally, classes marked as open can be subclassed and methods can be overridden outside of the module.
// public – This is very similar to open; however, classes can only be subclassed and methods can only be overridden inside (not outside of) the module.
// internal – This is the default. Anything in the current module can access this type, property, or method. For an app, only files within your project can access these. If you write a third-party library, then only files within that third-party library can access them – apps that use your third-party library cannot.
// fileprivate – Anything in the same source file can see this type, property, or method.
// private – Anything within the enclosing scope can access this type, property, or method.

