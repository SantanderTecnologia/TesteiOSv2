//
//  UserTests.swift
//  santander-challengeTests
//
//  Created by Kevin Oliveira on 02/05/20.
//  Copyright © 2020 Kevin Oliveira. All rights reserved.
//

import SwiftyJSON
import XCTest

class UserTests: XCTestCase {

    func testInstantiateFromJSON() {
        // GIVEN
        let json = JSON([
            "userId": 1,
            "name": "Foo Bar",
            "agency": "123",
            "bankAccount": "456",
            "balance": 9.999
        ])

        // WHEN
        let user = User.fromJSON(json: json)

        // THEN
        XCTAssertEqual(user.id, 1)
        XCTAssertEqual(user.name, "Foo Bar")
        XCTAssertEqual(user.agency, 123)
        XCTAssertEqual(user.account, 456)
        XCTAssertEqual(user.balance, 9.999)
    }
    
    func testUsersAreEqual() {
        // GIVEN
        let firstUser = User(id: 1, name: "Foo Bar", agency: 123, account: 456, balance: 9.9)
        let secondUser = User(id: 1, name: "Foo Bar", agency: 123, account: 456, balance: 9.9)
        
        // WHEN
        let areEqual = firstUser == secondUser

        // THEN
        XCTAssertTrue(areEqual)
    }

    func testUsersAreDifferent() {
        // GIVEN
        let firstUser = User(id: 1, name: "Foo Bar", agency: 123, account: 456, balance: 9.9)
        let secondUser = User(id: 2, name: "Foo", agency: 1234, account: 4567, balance: 10.9)

        // WHEN
        let areEqual = firstUser == secondUser

        // THEN
        XCTAssertFalse(areEqual)
    }
}
