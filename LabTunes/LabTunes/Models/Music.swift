//
//  Music.swift
//  LabTunes
//
//  Created by Carlos Santiago Cruz on 09/11/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import Foundation

class Music {
    static var urlSession = URLSession(configuration: .default)
    
    static func parseData(data: Data) -> NSDictionary? {
        let json = try! JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary
        return json
    }
    
    static func songsFrom(json: NSDictionary) -> [Song] {
        let results = json["results"] as! [NSDictionary]
        var songs: [Song] = []
        
        for dataResult in results {
            let song = Song.create(dict: dataResult)
            songs.append(song!)
        }
        return songs
    }
    
    static func fetchSongs(songName: String = "TheBeatles", OnSucced: @escaping ([Song]) -> Void) {
        let url = URL(string: "https://itunes.apple.com/search?media=music&entity=song&term=Queen")
        let dataTask = urlSession.dataTask(with: url!) { data, response, error in
            if error == nil {
                    guard let statusCode = (response as? HTTPURLResponse)?.statusCode else { return }
                    if statusCode == 200 {
                        guard let json = parseData(data: data!) else { return }
                        let songs = songsFrom(json: json)
                        OnSucced(songs)
                }
            }
        }
        dataTask.resume()
    }
}

