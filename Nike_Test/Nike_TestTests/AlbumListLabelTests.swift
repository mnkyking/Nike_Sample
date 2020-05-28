//
//  AlbumListLabelTests.swift
//  Nike_TestTests
//
//  Created by Robin G on 5/24/20.
//  Copyright © 2020 Robin G. All rights reserved.
//

import XCTest
@testable import Nike_Test

class AlbumListLabelTests: XCTestCase {
    
    let defaultColor = UIColor.black
    let defaultFont = UIFont(name: "Georgia", size: 14.0)

    func testMakeDefaultAlbumListLabel() {
        let listLabel = AlbumListLabel()
        XCTAssertEqual(listLabel.font, defaultFont)
        XCTAssertEqual(listLabel.textColor, defaultColor)
    }
    
    func testMakeAlbumListLabelWithSize() {
        guard let font = UIFont(name: "Georgia", size: 20.0) else {
            fatalError()
        }
        let listLabelFontChanged = AlbumListLabel(fontSize: font.pointSize)
        XCTAssertEqual(listLabelFontChanged.font, font)
        XCTAssertEqual(listLabelFontChanged.textColor, defaultColor)
    }
    
    func testMakeAlbumListLabelWithColor() {
        let color = UIColor.purple
        let listLabelColorChanged = AlbumListLabel(color: color)
        XCTAssertEqual(listLabelColorChanged.font, defaultFont)
        XCTAssertEqual(listLabelColorChanged.textColor, color)
    }
    
}
