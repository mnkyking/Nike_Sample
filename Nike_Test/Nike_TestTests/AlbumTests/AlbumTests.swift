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
        let url = "a url"
        
        let albumNoName = Album(name: nil, artistName: artistName, albumArt: albumArt, genres: genres, releaseDate: releaseDate, copyright: copyright, iTunesURL: url)
        XCTAssertNotNil(albumNoName)
        XCTAssertNil(albumNoName.name)
        XCTAssertNotNil(albumNoName.artistName)
        XCTAssertNotNil(albumNoName.albumArt)
        XCTAssertNotNil(albumNoName.genres)
        XCTAssertNotNil(albumNoName.releaseDate)
        XCTAssertNotNil(albumNoName.copyright)
        XCTAssertNotNil(albumNoName.iTunesURL)
        
        let albumNoArtistName = Album(name: albumName, artistName: nil, albumArt: albumArt, genres: genres, releaseDate: releaseDate, copyright: copyright, iTunesURL: url)
        XCTAssertNotNil(albumNoArtistName)
        XCTAssertNotNil(albumNoArtistName.name)
        XCTAssertNil(albumNoArtistName.artistName)
        XCTAssertNotNil(albumNoArtistName.albumArt)
        XCTAssertNotNil(albumNoArtistName.genres)
        XCTAssertNotNil(albumNoArtistName.releaseDate)
        XCTAssertNotNil(albumNoArtistName.copyright)
        XCTAssertNotNil(albumNoArtistName.iTunesURL)
        
        let albumNoAlbumArt = Album(name: albumName, artistName: artistName, albumArt: nil, genres: genres, releaseDate: releaseDate, copyright: copyright, iTunesURL: url)
        XCTAssertNotNil(albumNoAlbumArt)
        XCTAssertNotNil(albumNoAlbumArt.name)
        XCTAssertNotNil(albumNoAlbumArt.artistName)
        XCTAssertNil(albumNoAlbumArt.albumArt)
        XCTAssertNotNil(albumNoAlbumArt.genres)
        XCTAssertNotNil(albumNoAlbumArt.releaseDate)
        XCTAssertNotNil(albumNoAlbumArt.copyright)
        XCTAssertNotNil(albumNoAlbumArt.iTunesURL)
        
        let albumNoGenre = Album(name: albumName, artistName: artistName, albumArt: albumArt, genres: nil, releaseDate: releaseDate, copyright: copyright, iTunesURL: url)
        XCTAssertNotNil(albumNoGenre)
        XCTAssertNotNil(albumNoGenre.name)
        XCTAssertNotNil(albumNoGenre.artistName)
        XCTAssertNotNil(albumNoGenre.albumArt)
        XCTAssertNil(albumNoGenre.genres)
        XCTAssertNotNil(albumNoGenre.releaseDate)
        XCTAssertNotNil(albumNoGenre.copyright)
        XCTAssertNotNil(albumNoGenre.iTunesURL)
        
        let albumNoReleaseDate = Album(name: albumName, artistName: artistName, albumArt: albumArt, genres: genres, releaseDate: nil, copyright: copyright, iTunesURL: url)
        XCTAssertNotNil(albumNoReleaseDate)
        XCTAssertNotNil(albumNoReleaseDate.name)
        XCTAssertNotNil(albumNoReleaseDate.artistName)
        XCTAssertNotNil(albumNoReleaseDate.albumArt)
        XCTAssertNotNil(albumNoReleaseDate.genres)
        XCTAssertNil(albumNoReleaseDate.releaseDate)
        XCTAssertNotNil(albumNoReleaseDate.copyright)
        XCTAssertNotNil(albumNoReleaseDate.iTunesURL)
        
        let albumNoCopyright = Album(name: albumName, artistName: artistName, albumArt: albumArt, genres: genres, releaseDate: releaseDate, copyright: nil, iTunesURL: url)
        XCTAssertNotNil(albumNoCopyright)
        XCTAssertNotNil(albumNoCopyright.name)
        XCTAssertNotNil(albumNoCopyright.artistName)
        XCTAssertNotNil(albumNoCopyright.albumArt)
        XCTAssertNotNil(albumNoCopyright.genres)
        XCTAssertNotNil(albumNoCopyright.releaseDate)
        XCTAssertNil(albumNoCopyright.copyright)
        XCTAssertNotNil(albumNoCopyright.iTunesURL)
        
        let albumNoITunesURL = Album(name: albumName, artistName: artistName, albumArt: albumArt, genres: genres, releaseDate: releaseDate, copyright: copyright, iTunesURL: nil)
        XCTAssertNotNil(albumNoITunesURL)
        XCTAssertNotNil(albumNoITunesURL.name)
        XCTAssertNotNil(albumNoITunesURL.artistName)
        XCTAssertNotNil(albumNoITunesURL.albumArt)
        XCTAssertNotNil(albumNoITunesURL.genres)
        XCTAssertNotNil(albumNoITunesURL.releaseDate)
        XCTAssertNotNil(albumNoITunesURL.copyright)
        XCTAssertNil(albumNoITunesURL.iTunesURL)
    }

}
