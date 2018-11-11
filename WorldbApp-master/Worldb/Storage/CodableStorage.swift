//
//  CodableStorage.swift
//  Worldb
//
//  Created by Luis Ezcurdia on 9/29/18.
//  Copyright © 2018 Luis Ezcurdia. All rights reserved.
//

import Foundation

enum CodableStorage {
    case permanent(filename: String)
    case cache
    
    var filePath: URL? {
        switch self {
        case .permanent(let filename):
            StorageType.permanent.ensureExists()
            var filePath = StorageType.permanent.folder
            filePath.appendPathComponent(filename)
            return filePath
        default:
            print("Unaviable storage")
            return nil
        }
    }
    
    func load() -> [Country]? {
        switch self {
        case .permanent(_):
            if let data = try? Data(contentsOf: self.filePath!) {
              return try? JSONDecoder().decode([Country].self, from: data)
            }
        default:
            print("Unaviable")
        }
        return nil
    }
    
    func save(data dataSource: [Country]) {
        switch self {
        case .permanent(_):
            if let data = try? JSONEncoder().encode(dataSource) {
                try? data.write(to: self.filePath!)
            }
        default:
            print("Unaviable storage")
        }
    }
    
    
}
