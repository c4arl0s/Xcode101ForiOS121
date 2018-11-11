//
//  Country.swift
//  Worldb
//
//  Created by Luis Ezcurdia on 9/29/18.
//  Copyright © 2018 Luis Ezcurdia. All rights reserved.
//

import UIKit

struct Country: Codable {
    let id: Int
    let name: String
    let iso: String
    let languages: [String]
    private var flagFilename: String {
        return "flag-\(self.iso).png"
    }
    
    func flag() -> URL {
        return  URL(string: "https://www.countryflags.io/\(iso)/flat/64.png")!
    }
    
    func flagImage(completion: @escaping (UIImage) -> Void) {
        if let img = ImageStore.shared.image(forKey: self.flagFilename) {
            completion(img)
        }
        DispatchQueue.global(qos: .background).async {
            if let imgData = try? Data(contentsOf: self.flag()),
                let img = UIImage(data: imgData) {
                DispatchQueue.main.async { completion(img) }
                ImageStore.shared.setImage(img, forKey: self.flagFilename)
            }
        }
    }
}
