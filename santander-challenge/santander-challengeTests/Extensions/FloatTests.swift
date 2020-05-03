//
//  FloatTests.swift
//  santander-challengeTests
//
//  Created by Kevin Oliveira on 02/05/20.
//  Copyright © 2020 Kevin Oliveira. All rights reserved.
//

import XCTest

class FloatTests: XCTestCase {

    func testFloatToCurrency() {
        // GIVEN
        let float: Float = 9.9
        
        let currencyFormatter = NumberFormatter()
        currencyFormatter.locale = Locale.current
        currencyFormatter.numberStyle = .currency

        let expected = currencyFormatter.string(from: NSNumber(9.9)) ?? ""

        // WHEN
        let formattedFloatAsCurrency = float.toCurrency()

        // THEN
        XCTAssertEqual(formattedFloatAsCurrency, expected)
    }
}
