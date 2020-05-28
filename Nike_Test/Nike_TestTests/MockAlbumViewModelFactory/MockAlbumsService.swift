//
//  MockAlbumsService.swift
//  Nike_Test
//
//  Created by Robin G on 5/27/20.
//  Copyright © 2020 Robin G. All rights reserved.
//

import Foundation
@testable import Nike_Test

class MockAlbumsService: AlbumsServiceProtocol {
    
    func requestAlbumList(albumList: @escaping AlbumHandler) {
        let albums = AlbumTestsJSONLoader.loadAlbums()
        albumList(albums)
    }
    
}

