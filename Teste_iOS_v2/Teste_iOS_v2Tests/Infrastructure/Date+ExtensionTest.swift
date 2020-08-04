//
//  Date+ExtensionTest.swift
//  Teste_iOS_v2Tests
//
//  Created by Lucas Fernandes Araujo on 04/08/20.
//  Copyright © 2020 Lucas Fernandes Araujo. All rights reserved.
//

import XCTest
@testable import Teste_iOS_v2

class DateTest: XCTestCase {
    
    func testStringFromDate() {
        let date = Date(timeIntervalSince1970: 40000)
        XCTAssertEqual(date.getStringFullDate(), "01/01/1970")
    }
}
