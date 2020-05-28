//
//  AlbumDetailsViewModelTests.swift
//  Nike_TestTests
//
//  Created by Robin G on 5/26/20.
//  Copyright © 2020 Robin G. All rights reserved.
//

import XCTest
@testable import Nike_Test

class AlbumDetailsViewModelTests: XCTestCase {
    
    func makeViewModel(for json: AlbumTestsJSONLoader.JSON) -> AlbumDetailsViewModel {
        let album = AlbumTestsJSONLoader.load(json)
        let viewModel = MockAlbumViewModelFactory.makeDetailsViewModel(album: album)
        return viewModel
    }
    
    func testCanMakeViewModel() {
        let viewModel = makeViewModel(for: .base)
            
        XCTAssertEqual(viewModel.name, "album name")
        XCTAssertEqual(viewModel.artistName, "artist name")
        XCTAssertEqual(viewModel.genres, "Rock")
        XCTAssertEqual(viewModel.releaseDate, "Released 1964-25-01")
        XCTAssertEqual(viewModel.copyright, "copyright")
        XCTAssertEqual(viewModel.iTunesURL?.absoluteString, "https://aurl.com")
    }
    
    func testCanHandleNoReleaseDate() {
        let viewModel = makeViewModel(for: .empty(.releaseDate))
        
        XCTAssertEqual(viewModel.releaseDate, "Released ???")
    }
    
    func testCanHandleNoUrl() {
        let viewModel = makeViewModel(for: .empty(.itunesUrl))
        
        XCTAssertNil(viewModel.iTunesURL)
    }
    
    func testCanHandleNoImage() {
        let viewModel = makeViewModel(for: .base)
        var imageData: Data?
        let expectation = XCTestExpectation(description: "testCanHandleNoImage")
        
        viewModel.albumImage { (data) in
            imageData = data
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5.0)
        
        XCTAssertNil(imageData)
    }
    
}
