//
//  AlbumDetailsViewModel.swift
//  Nike_Test
//
//  Created by Robin G on 5/24/20.
//  Copyright © 2020 Robin G. All rights reserved.
//

import Foundation

class AlbumDetailsViewModel {
    
    let album: Album
    let dataService: LocalDataServiceProtocol
    
    init(album: Album, dataService: LocalDataServiceProtocol) {
        self.album = album
        self.dataService = dataService
    }
    
}
