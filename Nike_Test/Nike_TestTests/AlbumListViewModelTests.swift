//
//  AlbumListViewModelTests.swift
//  Nike_TestTests
//
//  Created by Robin G on 5/26/20.
//  Copyright © 2020 Robin G. All rights reserved.
//

import XCTest
@testable import Nike_Test

class AlbumListViewModelTests: XCTestCase {
    
    func testCanLoadAlbums() {
        let viewModel = MockAlbumViewModelFactory.makeListViewModel()
        let expectation = XCTestExpectation(description: "testCanLoadAlbums")
        
        viewModel.bind { expectation.fulfill() }
        viewModel.fetch()
        
        wait(for: [expectation], timeout: 5.0)
        
        XCTAssertEqual(viewModel.count, 100)
        XCTAssertEqual(viewModel.albumName(at: 0), "WUNNA")
        XCTAssertEqual(viewModel.artistName(at: 0), "Gunna")
    }
    
    func testCanMakeDetailsViewModel() {
        let listViewModel = MockAlbumViewModelFactory.makeListViewModel()
        let expectation = XCTestExpectation(description: "testCanLoadAlbums")
        listViewModel.bind { expectation.fulfill() }
        listViewModel.fetch()
        wait(for: [expectation], timeout: 5.0)
        
        let viewModel = listViewModel.detailViewModel(for: 0)
        XCTAssertNotNil(viewModel)
    }
    
    func testCanHandleOutOfBounds() {
        let viewModel = MockAlbumViewModelFactory.makeListViewModel()
        XCTAssertNil(viewModel.albumName(at: 0))
        XCTAssertNil(viewModel.artistName(at: 0))
        let nilViewModel = viewModel.detailViewModel(for: 0)
        XCTAssertNil(nilViewModel)
    }
    
    func testCanHandleNoImage() {
        let viewModel = MockAlbumViewModelFactory.makeSingleListViewModel()
        var imageData: Data?
        let loadExpectation = XCTestExpectation(description: "testCanHandleNoImage_load")
        let imageExpectation = XCTestExpectation(description: "testCanHandleNoImage_image")
        viewModel.bind { loadExpectation.fulfill() }
        viewModel.fetch()
        
        viewModel.albumImage(at: 0) { (_, data) in
            imageData = data
            imageExpectation.fulfill()
        }
        wait(for: [loadExpectation, imageExpectation], timeout: 5.0)
        
        XCTAssertEqual(viewModel.count, 1)
        XCTAssertNil(imageData)
    }

}
