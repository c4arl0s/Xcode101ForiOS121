//
//  MovieInfo.swift
//  UseOfCodableAndCodingKey
//
//  Created by Carlos Santiago Cruz on 12/1/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import Foundation

struct MovieInfo: Codable {
    var name: String
    var moviesGenre: [MovieGenre]
    var rating: Int
    
    enum MovieGenre: String, Codable {
        case horror
        case skifi
        case comedy
        case adventure
        case animation
    }
}
let upMovie = MovieInfo(name: "up", moviesGenre: [.adventure, .comedy], rating: 5)

// encode data



