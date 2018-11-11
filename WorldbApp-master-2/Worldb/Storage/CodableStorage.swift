//
//  CodableStorage.swift
//  Worldb
//
//  Created by Luis Ezcurdia on 9/29/18.
//  Copyright © 2018 Luis Ezcurdia. All rights reserved.
//

import Foundation

enum CodableStorage<T> where T: Codable {
    case permanent(filename: String)
    case cache
    
    var filePath: URL? {
        switch self {
        case .permanent(let filename):
            var filePath = StorageType.permanent.folder
            filePath.appendPathComponent(filename)
            return filePath
        default:
            return nil
        }
    }
    // load data
    func load() -> T? {
        switch self {
        case .permanent(_):
            guard let data = try? Data(contentsOf: self.filePath!) else { return nil }
            return try? JSONDecoder().decode(T.self, from: data)
        default:
            print("Unable to load filepath: \(String(describing: self.filePath))")
            return nil
        }
    }
    // save data
    func save(data dataSource: T) {
        switch self {
        case .permanent(_):
            if let data = try? JSONEncoder().encode(dataSource) {
                try? data.write(to: self.filePath!)
            }
        default:
            print("Unaviable save storage")
        }
    }
}
