//
//  AlbumTests.swift
//  Nike_TestTests
//
//  Created by Robin G on 5/23/20.
//  Copyright © 2020 Robin G. All rights reserved.
//

import XCTest
@testable import Nike_Test

class AlbumTests: XCTestCase {

    func testAlbumNilProperties() {
        let albumName = "album name"
        let artistName = "artist name"
        let albumArt = "thumbnail art"
        let genres = [Genre(name: "Rock")]
        let releaseDate = "2020-05-23"
        let copyright = "copyright"
        
        let albumNoName = Album(name: nil, artistName: artistName, albumArt: albumArt, genres: genres, releaseDate: releaseDate, copyright: copyright)
        XCTAssertNotNil(albumNoName)
        XCTAssertNil(albumNoName.name)
        XCTAssertNotNil(albumNoName.artistName)
        XCTAssertNotNil(albumNoName.albumArt)
        XCTAssertNotNil(albumNoName.genres)
        XCTAssertNotNil(albumNoName.releaseDate)
        XCTAssertNotNil(albumNoName.copyright)
        
        let albumNoArtistName = Album(name: albumName, artistName: nil, albumArt: albumArt, genres: genres, releaseDate: releaseDate, copyright: copyright)
        XCTAssertNotNil(albumNoArtistName)
        XCTAssertNotNil(albumNoArtistName.name)
        XCTAssertNil(albumNoArtistName.artistName)
        XCTAssertNotNil(albumNoArtistName.albumArt)
        XCTAssertNotNil(albumNoArtistName.genres)
        XCTAssertNotNil(albumNoArtistName.releaseDate)
        XCTAssertNotNil(albumNoArtistName.copyright)
        
        let albumNoAlbumArt = Album(name: albumName, artistName: artistName, albumArt: nil, genres: genres, releaseDate: releaseDate, copyright: copyright)
        XCTAssertNotNil(albumNoAlbumArt)
        XCTAssertNotNil(albumNoAlbumArt.name)
        XCTAssertNotNil(albumNoAlbumArt.artistName)
        XCTAssertNil(albumNoAlbumArt.albumArt)
        XCTAssertNotNil(albumNoAlbumArt.genres)
        XCTAssertNotNil(albumNoAlbumArt.releaseDate)
        XCTAssertNotNil(albumNoAlbumArt.copyright)
        
        let albumNoGenre = Album(name: albumName, artistName: artistName, albumArt: albumArt, genres: nil, releaseDate: releaseDate, copyright: copyright)
        XCTAssertNotNil(albumNoGenre)
        XCTAssertNotNil(albumNoGenre.name)
        XCTAssertNotNil(albumNoGenre.artistName)
        XCTAssertNotNil(albumNoGenre.albumArt)
        XCTAssertNil(albumNoGenre.genres)
        XCTAssertNotNil(albumNoGenre.releaseDate)
        XCTAssertNotNil(albumNoGenre.copyright)
        
        let albumNoReleaseDate = Album(name: albumName, artistName: artistName, albumArt: albumArt, genres: genres, releaseDate: nil, copyright: copyright)
        XCTAssertNotNil(albumNoReleaseDate)
        XCTAssertNotNil(albumNoReleaseDate.name)
        XCTAssertNotNil(albumNoReleaseDate.artistName)
        XCTAssertNotNil(albumNoReleaseDate.albumArt)
        XCTAssertNotNil(albumNoReleaseDate.genres)
        XCTAssertNil(albumNoReleaseDate.releaseDate)
        XCTAssertNotNil(albumNoReleaseDate.copyright)
        
        let albumNoCopyright = Album(name: albumName, artistName: artistName, albumArt: albumArt, genres: genres, releaseDate: releaseDate, copyright: nil)
        XCTAssertNotNil(albumNoCopyright)
        XCTAssertNotNil(albumNoCopyright.name)
        XCTAssertNotNil(albumNoCopyright.artistName)
        XCTAssertNotNil(albumNoCopyright.albumArt)
        XCTAssertNotNil(albumNoCopyright.genres)
        XCTAssertNotNil(albumNoCopyright.releaseDate)
        XCTAssertNil(albumNoCopyright.copyright)
    }

}
