//
//  Song.swift
//  LabTunes
//
//  Created by Carlos Santiago Cruz on 09/11/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import Foundation

struct Song {
    var artist: String
    var name: String
    
    static func create(dict: NSDictionary) -> Song? {
        guard let trackName = dict["trackName"] as? String else {
            return nil
        }
        guard let artist = dict["artistName"] as? String else{
            return nil
        }
        return Song(artist: artist, name: trackName)
    }
    
}
