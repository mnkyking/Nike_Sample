//
//  AlbumsServiceProtocol.swift
//  Nike_Test
//
//  Created by Robin G on 5/26/20.
//  Copyright © 2020 Robin G. All rights reserved.
//

import Foundation

typealias AlbumHandler = ([Album])->()

protocol AlbumsServiceProtocol {
    func requestAlbumList(albumList: @escaping AlbumHandler)
}
