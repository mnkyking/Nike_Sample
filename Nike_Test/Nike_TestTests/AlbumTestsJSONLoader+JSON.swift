//
//  AlbumTestsJSONLoader+JSON.swift
//  Nike_Test
//
//  Created by Robin G on 5/27/20.
//  Copyright © 2020 Robin G. All rights reserved.
//

import Foundation

extension AlbumTestsJSONLoader {
    
    enum JSON {
        case base
        case all
        case feed
        case empty(EmptyJSON)
    }
    
    enum EmptyJSON: String {
        case albumName = "album_name"
        case artistName = "artist_name"
        case albumArt = "album_art"
        case genres = "genres"
        case releaseDate = "release_date"
        case copyright = "copyright"
        case itunesUrl = "itunes_url"
    }
    
}

extension AlbumTestsJSONLoader.JSON {
    
    var pathString: String {
        let pathString: String
        switch self {
        case .feed:
            pathString = "feed"
        case .all:
            pathString = "all"
        case .base:
            pathString = "album_base"
        case .empty(let path):
            pathString = "album_empty_\(path.rawValue)"
        }
        return pathString
    }
    
    var url: URL {
        let bundle = Bundle(for: AlbumTestsJSONLoader.self)
        guard let filePath = bundle.path(forResource: pathString, ofType: "json") else {
            fatalError("file \(pathString) is missing from AlbumTests")
        }
        let url = URL(fileURLWithPath: filePath)
        return url
    }
    
}
