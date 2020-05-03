//
//  DateTests.swift
//  santander-challengeTests
//
//  Created by Kevin Oliveira on 02/05/20.
//  Copyright © 2020 Kevin Oliveira. All rights reserved.
//

import XCTest

class DateTests: XCTestCase {

    func testDateToString() {
        // GIVEN
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let date = dateFormatter.date(from: "2020-05-01") ?? Date()
        
        let expected = "01/05/2020"

        // WHEN
        let formattedDate = date.toString()

        // THEN
        XCTAssertEqual(formattedDate, expected)
    }
}
