//
//  Album.swift
//  Nike_Test
//
//  Created by Robin G on 5/19/20.
//  Copyright © 2020 Robin G. All rights reserved.
//

import Foundation

struct Album: Decodable {
    let name: String?
    let artistName: String?
    let albumArt: String?
    let genres: [Genre]?
    let releaseDate: String?
    let copyright: String?
    let iTunesURL: String?
    
    private enum CodingKeys: String, CodingKey {
        case name
        case artistName
        case albumArt = "artworkUrl100"
        case genres
        case releaseDate
        case copyright
        case iTunesURL = "url"
    }
}

struct Genre: Decodable {
    let name: String?
}

struct Feed: Decodable {
    let results: [Album]?
}

struct RSSFeed: Decodable {
    let feed: Feed?
}
