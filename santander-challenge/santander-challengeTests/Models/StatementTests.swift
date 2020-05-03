//
//  StatementTests.swift
//  santander-challengeTests
//
//  Created by Kevin Oliveira on 02/05/20.
//  Copyright © 2020 Kevin Oliveira. All rights reserved.
//

import SwiftyJSON
import XCTest

class StatementTests: XCTestCase {

   func testInstantiateFromJSON() {
       // GIVEN
       let json = JSON([
           "title": "Foo Bar",
           "desc": "Bar Baz",
           "date": "2020-05-01",
           "value": -5.5,
        ])

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let expectedDate = dateFormatter.date(from: "2020-05-01") ?? Date()

        // WHEN
        let statement = Statement.fromJSON(json: json)

        // THEN
        XCTAssertEqual(statement.title, "Foo Bar")
        XCTAssertEqual(statement.description, "Bar Baz")
        XCTAssertEqual(statement.date, expectedDate)
        XCTAssertEqual(statement.value, -5.5)
    }
    
    func testStatementsAreEqual() {
        // GIVEN
        let date = Date()
        let firstStatement = Statement(title: "Foo Bar", description: "Bar Baz", date: date, value: 1.1)
        let secondStatement = Statement(title: "Foo Bar", description: "Bar Baz", date: date, value: 1.1)
        
        // WHEN
        let areEqual = firstStatement == secondStatement

        // THEN
        XCTAssertTrue(areEqual)
    }

    func testStatementsAreDifferent() {
        // GIVEN
        let firstStatement = Statement(title: "Foo", description: "Bar", date: Date(), value: 1)
        let secondStatement = Statement(title: "Foo Bar", description: "Bar Baz", date: Date(), value: 1.1)
        
        // WHEN
        let areEqual = firstStatement == secondStatement

        // THEN
        XCTAssertFalse(areEqual)
    }
}
