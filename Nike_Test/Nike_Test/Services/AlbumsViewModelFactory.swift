//
//  AlbumsViewModelFactory.swift
//  Nike_Test
//
//  Created by Robin G on 5/24/20.
//  Copyright © 2020 Robin G. All rights reserved.
//

import Foundation

enum AlbumsViewModelFactory {
    
    static let dataService = LocalDataService()
    static let albumsService = AlbumsService()
    
    static func makeListViewModel() -> AlbumListViewModel {
        return AlbumListViewModel(dataService: dataService, albumsService: albumsService)
    }
    
    static func makeDetailsViewModel(album: Album) -> AlbumDetailsViewModel {
        return AlbumDetailsViewModel(album: album, dataService: dataService)
    }
    
}
