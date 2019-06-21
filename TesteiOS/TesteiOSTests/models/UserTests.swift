//
//  UserTests.swift
//  TesteiOSTests
//
//  Created by Fernando Gomes on 19/06/19.
//  Copyright © 2019 Fernando Gomes. All rights reserved.
//

import XCTest
import ObjectMapper
@testable import TesteiOS

class UserTests: XCTestCase {
    
    let userJson: [String: Any] = ["userId": 1, "name": "luis", "bankAccount": "123434","agency": "999","balance":1000.00]
    var userAccount: UserAccount!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        userAccount = Mapper<UserAccount>().map(JSON: userJson)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCreateUser() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertNotNil(userAccount)
        XCTAssertEqual(userAccount?.userId, 1)
        XCTAssertEqual(userAccount?.name, "luis")
        XCTAssertEqual(userAccount?.bankAccount, "123434")
        XCTAssertEqual(userAccount?.agency, "999")
        XCTAssertEqual(userAccount?.balance, 1000.00)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
