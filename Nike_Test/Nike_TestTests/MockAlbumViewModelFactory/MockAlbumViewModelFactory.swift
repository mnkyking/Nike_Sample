//
//  MockAlbumViewModelFactory.swift
//  Nike_Test
//
//  Created by Robin G on 5/27/20.
//  Copyright © 2020 Robin G. All rights reserved.
//

import Foundation
@testable import Nike_Test

enum MockAlbumViewModelFactory {
    
    static let dataService = MockDataService()
    static let albumsService = MockAlbumsService()
    
    static func makeListViewModel() -> AlbumListViewModel {
        return AlbumListViewModel(dataService: dataService, albumsService: albumsService)
    }
    
    static func makeSingleListViewModel() -> AlbumListViewModel {
        return AlbumListViewModel(dataService: dataService, albumsService: SingleMockAlbumService())
    }
    
    static func makeDetailsViewModel(album: Album) -> AlbumDetailsViewModel {
        return AlbumDetailsViewModel(album: album, dataService: dataService)
    }
    
}
