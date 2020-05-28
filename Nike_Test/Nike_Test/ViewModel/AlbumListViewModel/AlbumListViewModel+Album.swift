//
//  AlbumListViewModel+Album.swift
//  Nike_Test
//
//  Created by Robin G on 5/27/20.
//  Copyright © 2020 Robin G. All rights reserved.
//

import Foundation

extension AlbumListViewModel {
    
    var count: Int {
        return albumList.count
    }
    
    func albumName(at index: Int) -> String? {
        guard let album = albumList[safely: index] else { return nil }
        return album.name
    }
    
    func artistName(at index: Int) -> String? {
        guard let album = albumList[safely: index] else { return nil }
        return album.artistName
    }
    
    func albumImage(at index: Int, _ completion: @escaping IntDataHandler) {
        guard let album = albumList[safely: index] else {
            completion(index, nil)
            return
        }
        guard let albumUrl = album.albumArt, let url = URL(string:albumUrl) else {
            completion(index, nil)
            return
        }
        dataService.get(from: url) { (data) in
            completion(index, data)
        }
    }
    
    func detailViewModel(for index: Int) -> AlbumDetailsViewModel? {
        guard let album = albumList[safely: index] else { return nil }
        return AlbumsViewModelFactory.makeDetailsViewModel(album: album)
    }
    
}
