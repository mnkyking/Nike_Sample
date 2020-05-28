//
//  AlbumListViewModel+Service.swift
//  Nike_Test
//
//  Created by Robin G on 5/27/20.
//  Copyright © 2020 Robin G. All rights reserved.
//

import Foundation

extension AlbumListViewModel {
    func fetch() {
        albumsService.requestAlbumList { (albums) in
            self.albumList = albums
        }
    }
    
}
