//
//  AlbumListViewModel.swift
//  Nike_Test
//
//  Created by Robin G on 5/24/20.
//  Copyright © 2020 Robin G. All rights reserved.
//

import Foundation

typealias IntDataHandler = (Int, Data?)->Void
typealias UpdateHandler = ()->Void

class AlbumListViewModel {
    
    var albumList: [Album] = [] {
        didSet {
            updateHandler?()
        }
    }
    let dataService: LocalDataServiceProtocol
    let albumsService: AlbumsServiceProtocol
    private var updateHandler: UpdateHandler?
    
    init(dataService: LocalDataServiceProtocol, albumsService: AlbumsServiceProtocol) {
        self.dataService = dataService
        self.albumsService = albumsService
    }
    
    func bind(_ handler: @escaping UpdateHandler) {
        updateHandler = handler
    }
    
}

