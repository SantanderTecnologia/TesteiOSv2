//
//  ExtensionTests.swift
//  BankAppTests
//
//  Created by Pedro Veloso on 22/05/19.
//  Copyright © 2019 pedrofveloso. All rights reserved.
//

import XCTest
@testable import BankApp

class ExtensionTests: XCTestCase {

    func testToCurrency() {
        let value = 1234.55
        XCTAssertEqual(value.toCurrency, "R$ 1.234,55")
    }
    
    func testToDateWhenDateIsInvalid() {
        let date = "2019-20-20"
        XCTAssertNil(date.toDate, "toDate should return nil")
    }
    
    func testToDateWhenDateIsValid() {
        let date = "2019-10-11"
        XCTAssertEqual(date.toDate, "11/10/2019")
    }
}
