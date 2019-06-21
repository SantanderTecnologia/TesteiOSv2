//
//  StatementWorkerTests.swift
//  TesteiOSTests
//
//  Created by Fernando Gomes on 19/06/19.
//  Copyright © 2019 Fernando Gomes. All rights reserved.
//

import XCTest
import ObjectMapper
@testable import TesteiOS

class StatementWorkerTests: XCTestCase {

    var statementWorker: StatementWorker!
    var statementRequest: Statements.get.Request!
    let userJson: [String: Any] = ["userId": 1, "name": "luis", "bankAccount": "123434","agency": "999","balance":1000.00]
    var userAccount: UserAccount!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        userAccount = Mapper<UserAccount>().map(JSON: userJson)
        statementWorker = StatementWorker()
        statementRequest = Statements.get.Request.init(userAccount: userAccount)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testStatement() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        statementWorker.getStatments(request: statementRequest, callback: {
            response in
            var statements = response?.statements
            let statement: Statement = statements![0]
            
            XCTAssertNotNil(response?.statements)
            XCTAssertNotNil(response?.statements?.isEmpty)
            
            XCTAssertFalse(statement.title!.isEmpty)
            XCTAssertFalse(statement.description!.isEmpty)
            XCTAssertFalse(statement.date!.isEmpty)
            XCTAssertFalse(statement.value!.isNaN)
        })
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
