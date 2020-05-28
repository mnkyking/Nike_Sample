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

    func testLowerOutOfBoundsIsNil() {
        let array = [1, 2, 3]
        
        let lower = array[safely: -1]
        
        XCTAssertNil(lower)
    }
    
    func testUpperOutOfBoundsIsNil() {
        let array = [1, 2, 3]
        
        let upper = array[safely: Int.max]
        
        XCTAssertNil(upper)
    }
    
    func testInBoundsIsOkay() {
        let array = [1, 2, 3]
        
        XCTAssertEqual(array[safely: 0], 1)
        XCTAssertEqual(array[safely: 1], 2)
        XCTAssertEqual(array[safely: 2], 3)
    }
    
}
