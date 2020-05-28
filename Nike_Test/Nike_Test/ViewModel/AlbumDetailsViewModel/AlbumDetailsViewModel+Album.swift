//
//  AlbumDetailsViewModel+Album.swift
//  Nike_Test
//
//  Created by Robin G on 5/27/20.
//  Copyright © 2020 Robin G. All rights reserved.
//

import Foundation

extension AlbumDetailsViewModel {
    
    var name: String? {
        return album.name
    }
    
    var artistName: String? {
        return album.artistName
    }
    
    var genres: String? {
        return album.genres?.compactMap { $0.name }.joined(separator: ", ")
    }
    
    var releaseDate: String {
        return "Released " + (album.releaseDate ?? "???")
    }
    
    var copyright: String? {
        return album.copyright
    }
    
    var iTunesURL: URL? {
        guard let albumUrl = album.iTunesURL, let url = URL(string: albumUrl) else {
            return nil
        }
        return url
    }
    
    func albumImage(_ completion: @escaping DataHandler) {
        guard let albumUrl = album.albumArt, let url = URL(string: albumUrl) else {
            completion(nil)
            return
        }
        dataService.get(from: url) { (data) in
            completion(data)
        }
    }
    
}
