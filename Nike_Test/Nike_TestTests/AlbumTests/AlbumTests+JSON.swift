//
//  AlbumTests+JSON.swift
//  Nike_TestTests
//
//  Created by Robin G on 5/27/20.
//  Copyright © 2020 Robin G. All rights reserved.
//

import XCTest
@testable import Nike_Test

extension AlbumTests {
    
    func testAlbumNilAlbumNameFromJSON() {
        let albumNoName = AlbumTestsJSONLoader.load(.empty(.albumName))
        XCTAssertNotNil(albumNoName)
        XCTAssertNil(albumNoName.name)
        XCTAssertNotNil(albumNoName.artistName)
        XCTAssertNotNil(albumNoName.albumArt)
        XCTAssertNotNil(albumNoName.genres)
        XCTAssertNotNil(albumNoName.releaseDate)
        XCTAssertNotNil(albumNoName.copyright)
        XCTAssertNotNil(albumNoName.iTunesURL)
    }
    
    func testAlbumNilArtistNameFromJSON() {
        let albumNoArtistName = AlbumTestsJSONLoader.load(.empty(.artistName))
        XCTAssertNotNil(albumNoArtistName)
        XCTAssertNotNil(albumNoArtistName.name)
        XCTAssertNil(albumNoArtistName.artistName)
        XCTAssertNotNil(albumNoArtistName.albumArt)
        XCTAssertNotNil(albumNoArtistName.genres)
        XCTAssertNotNil(albumNoArtistName.releaseDate)
        XCTAssertNotNil(albumNoArtistName.copyright)
        XCTAssertNotNil(albumNoArtistName.iTunesURL)
        
    }
    func testAlbumNilAlbumArtFromJSON() {
        let albumNoAlbumArt = AlbumTestsJSONLoader.load(.empty(.albumArt))
        XCTAssertNotNil(albumNoAlbumArt)
        XCTAssertNotNil(albumNoAlbumArt.name)
        XCTAssertNotNil(albumNoAlbumArt.artistName)
        XCTAssertNil(albumNoAlbumArt.albumArt)
        XCTAssertNotNil(albumNoAlbumArt.genres)
        XCTAssertNotNil(albumNoAlbumArt.releaseDate)
        XCTAssertNotNil(albumNoAlbumArt.copyright)
        XCTAssertNotNil(albumNoAlbumArt.iTunesURL)
        
    }
    func testAlbumNilGenresFromJSON() {
        let albumNoGenre = AlbumTestsJSONLoader.load(.empty(.genres))
        XCTAssertNotNil(albumNoGenre)
        XCTAssertNotNil(albumNoGenre.name)
        XCTAssertNotNil(albumNoGenre.artistName)
        XCTAssertNotNil(albumNoGenre.albumArt)
        XCTAssertNil(albumNoGenre.genres)
        XCTAssertNotNil(albumNoGenre.releaseDate)
        XCTAssertNotNil(albumNoGenre.copyright)
        XCTAssertNotNil(albumNoGenre.iTunesURL)
        
    }
    func testAlbumNilReleaseDateFromJSON() {
        let albumNoReleaseDate = AlbumTestsJSONLoader.load(.empty(.releaseDate))
        XCTAssertNotNil(albumNoReleaseDate)
        XCTAssertNotNil(albumNoReleaseDate.name)
        XCTAssertNotNil(albumNoReleaseDate.artistName)
        XCTAssertNotNil(albumNoReleaseDate.albumArt)
        XCTAssertNotNil(albumNoReleaseDate.genres)
        XCTAssertNil(albumNoReleaseDate.releaseDate)
        XCTAssertNotNil(albumNoReleaseDate.copyright)
        XCTAssertNotNil(albumNoReleaseDate.iTunesURL)
        
    }
    func testAlbumNilCopyrightFromJSON() {
        let albumNoCopyright = AlbumTestsJSONLoader.load(.empty(.copyright))
        XCTAssertNotNil(albumNoCopyright)
        XCTAssertNotNil(albumNoCopyright.name)
        XCTAssertNotNil(albumNoCopyright.artistName)
        XCTAssertNotNil(albumNoCopyright.albumArt)
        XCTAssertNotNil(albumNoCopyright.genres)
        XCTAssertNotNil(albumNoCopyright.releaseDate)
        XCTAssertNil(albumNoCopyright.copyright)
        XCTAssertNotNil(albumNoCopyright.iTunesURL)
        
    }
    func testAlbumNiliTunesUrlFromJSON() {
        let albumNoITunesURL = AlbumTestsJSONLoader.load(.empty(.itunesUrl))
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
