//
//  ImageStore.swift
//  Worldb
//
//  Created by Luis Ezcurdia on 10/5/18.
//  Copyright © 2018 Luis Ezcurdia. All rights reserved.
//

import UIKit

class ImageStore {
    static let shared = ImageStore()
    
    private let cache = NSCache<NSString, UIImage>()
    private func imageURL(forKey key: String) -> URL {
        var directory = StorageType.cache.folder
        directory.appendPathComponent(key)
        return directory
    }
    // SET OBJECT
    func setImage(_ image: UIImage, forKey key: String) {
        print("[\(key)] Write on memory...")
        cache.setObject(image, forKey: key as NSString)
        let url = imageURL(forKey: key)
        // dataSha1
        let dataSha1 = UIImagePNGRepresentation(image)?.sha1()
        if let data = image.pngData() {
        // if let data = image.jpegData(compressionQuality: 0.75) {
        // if let data = UIImageJPEGRepresentation(image, 0.75) {
            print("[\(key)] Write on disk...")
            try? data.write(to: url, options: [.atomic])
        }
    }
    // get object
    func image(forKey key: String) -> UIImage? {
        print("[\(key)] Read from memory...")
        if let existingImage = cache.object(forKey: key as NSString) {
            return existingImage
        }
        
        let url = imageURL(forKey: key)
        
        print("[\(key)] Read from disk...")
        guard let imageFromDisk = UIImage(contentsOfFile: url.path) else {
            return nil
        }
        
        print("[\(key)] Write on memory...")
        cache.setObject(imageFromDisk, forKey: key as NSString)
        return imageFromDisk
    }
    // Removes the value of the specified key in the cache.
    func deleteImage(forKey key: String) {
        cache.removeObject(forKey: key as NSString)
        
        let url = imageURL(forKey: key)
        do {
            try FileManager.default.removeItem(at: url)
        } catch let deleteError {
            print("Error removing the image from disk: \(deleteError)")
        }
    }
    
}
