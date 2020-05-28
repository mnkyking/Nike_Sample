//
//  AlbumsService.swift
//  Nike_Test
//
//  Created by Robin G on 5/26/20.
//  Copyright © 2020 Robin G. All rights reserved.
//

import Foundation

class AlbumsService: AlbumsServiceProtocol {
    
    let networkService: NetworkService
    
    init(_ service: NetworkService = NetworkService()) {
        self.networkService = service
    }
    
    // TODO: - Add error handling when cannot retrieve data or properly decode data
    func requestAlbumList(albumList: @escaping AlbumHandler) {
        let url = Constants.url
        networkService.request(url: url) { (rssFeed: RSSFeed?) in
            let albums = rssFeed?.feed?.results ?? []
            albumList(albums)
        }
    }
    
}
