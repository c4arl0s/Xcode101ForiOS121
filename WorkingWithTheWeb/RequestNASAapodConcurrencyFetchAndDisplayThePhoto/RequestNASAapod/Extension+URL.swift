//
//  Extension+URL.swift
//  RequestNASAapod
//
//  Created by Carlos Santiago Cruz on 11/20/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import Foundation

extension URL {
    func withQueries (_ queries: [String: String]) -> URL? {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = queries.map{ URLQueryItem(name: $0.0, value: $0.1)
        }
        return components?.url
    }
}
