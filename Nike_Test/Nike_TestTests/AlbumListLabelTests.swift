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

    func testAlbumListLabelInit() {
        let listLabel = AlbumListLabel()
        let defaultFont = UIFont(name: "Georgia", size: 14.0)
        let defaultColor = UIColor.black
        XCTAssertEqual(listLabel.font, defaultFont)
        XCTAssertEqual(listLabel.textColor, defaultColor)
        
        let font = UIFont(name: "Georgia", size: 20.0)!
        let listLabelFontChanged = AlbumListLabel(fontSize: font.pointSize)
        XCTAssertEqual(listLabelFontChanged.font, font)
        XCTAssertEqual(listLabelFontChanged.textColor, defaultColor)
        
        let color = UIColor.purple
        let listLabelColorChanged = AlbumListLabel(color: color)
        XCTAssertEqual(listLabelColorChanged.font, defaultFont)
        XCTAssertEqual(listLabelColorChanged.textColor, color)
    }
}
