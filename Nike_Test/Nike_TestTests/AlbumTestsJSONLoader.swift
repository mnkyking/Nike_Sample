//
//  AlbumTestsJSONLoader.swift
//  Nike_Test
//
//  Created by Robin G on 5/27/20.
//  Copyright © 2020 Robin G. All rights reserved.
//

import Foundation
@testable import Nike_Test

class AlbumTestsJSONLoader {
    
    static func loadAlbums() -> [Album] {
        loadHelper(.all)
    }
    
    static func loadFeed() -> Feed {
        loadHelper(.feed)
    }
    
    static func load(_ json: AlbumTestsJSONLoader.JSON) -> Album {
        loadHelper(json)
    }
    
    private static func loadHelper<Model: Decodable>(_ json: AlbumTestsJSONLoader.JSON) -> Model {
        do {
            let data = try Data(contentsOf: json.url)
            let decoder = JSONDecoder()
            return try decoder.decode(Model.self, from: data)
        } catch _ as DecodingError {
            fatalError("Could not decode \(json.pathString) in AlbumTests")
        } catch {
            fatalError("file \(json.pathString) is missing from AlbumTests")
        }
    }
    
}

