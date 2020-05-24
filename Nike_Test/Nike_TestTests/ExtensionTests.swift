//
//  ExtensionTests.swift
//  Nike_TestTests
//
//  Created by Robin G on 5/24/20.
//  Copyright © 2020 Robin G. All rights reserved.
//

import XCTest
@testable import Nike_Test

class ExtensionTests: XCTestCase {

    func testStringAddSuffix() {
        let prefix = "Hello"
        let suffix = "world!"
        let combinedString = prefix.addSuffix(suffix)
        XCTAssertEqual(combinedString, "Hello world!")
    }

}
