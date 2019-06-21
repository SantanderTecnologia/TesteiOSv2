//
//  StatementTests.swift
//  TesteiOSTests
//
//  Created by Fernando Gomes on 19/06/19.
//  Copyright © 2019 Fernando Gomes. All rights reserved.
//

import XCTest
import ObjectMapper
@testable import TesteiOS

class StatementTests: XCTestCase {
    
    var statementJson: [String: Any]! = nil
    var statement: Statement!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        statementJson = ["title": "Pagamento",
                             "desc": "Conta de luz",
                             "date": "2018-08-15",
                             "value": -50.0]
        statement = Mapper<Statement>().map(JSON: statementJson)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCreateStatement() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        XCTAssertNotNil(statement)
        XCTAssertEqual(statement.title, "Pagamento")
        XCTAssertEqual(statement.description, "Conta de luz")
        XCTAssertEqual(statement.date, "2018-08-15")
        XCTAssertEqual(statement.value, -50.0)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
