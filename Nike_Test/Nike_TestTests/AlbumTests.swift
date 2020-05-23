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
        let currentDate = Date()
        
        let albumNoName = Album(name: nil, artistName: "artist name", genres: [Genre(genreId: 1, name: "Rock")], releaseDate: currentDate, copyright: "copyright")
        XCTAssertNotNil(albumNoName)
        XCTAssertNil(albumNoName.name)
        XCTAssertNotNil(albumNoName.artistName)
        XCTAssertNotNil(albumNoName.genres)
        XCTAssertNotNil(albumNoName.releaseDate)
        XCTAssertNotNil(albumNoName.copyright)
        
        let albumNoArtistName = Album(name: "album name", artistName: nil, genres: [Genre(genreId: 1, name: "Rock")], releaseDate: currentDate, copyright: "copyright")
        XCTAssertNotNil(albumNoArtistName)
        XCTAssertNotNil(albumNoArtistName.name)
        XCTAssertNil(albumNoArtistName.artistName)
        XCTAssertNotNil(albumNoArtistName.genres)
        XCTAssertNotNil(albumNoArtistName.releaseDate)
        XCTAssertNotNil(albumNoArtistName.copyright)
        
        let albumNoGenre = Album(name: "album name", artistName: "artist name", genres: nil, releaseDate: currentDate, copyright: "copyright")
        XCTAssertNotNil(albumNoGenre)
        XCTAssertNotNil(albumNoGenre.name)
        XCTAssertNotNil(albumNoGenre.artistName)
        XCTAssertNil(albumNoGenre.genres)
        XCTAssertNotNil(albumNoGenre.releaseDate)
        XCTAssertNotNil(albumNoGenre.copyright)
        
        let albumNoReleaseDate = Album(name: "album name", artistName: "artist name", genres: [Genre(genreId: 1, name: "Rock")], releaseDate: nil, copyright: "copyright")
        XCTAssertNotNil(albumNoReleaseDate)
        XCTAssertNotNil(albumNoReleaseDate.name)
        XCTAssertNotNil(albumNoReleaseDate.artistName)
        XCTAssertNotNil(albumNoReleaseDate.genres)
        XCTAssertNil(albumNoReleaseDate.releaseDate)
        XCTAssertNotNil(albumNoReleaseDate.copyright)
        
        let albumNoCopyright = Album(name: "album name", artistName: "artist name", genres: [Genre(genreId: 1, name: "Rock")], releaseDate: currentDate, copyright: nil)
        XCTAssertNotNil(albumNoCopyright)
        XCTAssertNotNil(albumNoCopyright.name)
        XCTAssertNotNil(albumNoCopyright.artistName)
        XCTAssertNotNil(albumNoCopyright.genres)
        XCTAssertNotNil(albumNoCopyright.releaseDate)
        XCTAssertNil(albumNoCopyright.copyright)
    }

}
