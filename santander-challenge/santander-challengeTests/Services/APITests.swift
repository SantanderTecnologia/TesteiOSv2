//
//  APITests.swift
//  santander-challengeTests
//
//  Created by Kevin Oliveira on 02/05/20.
//  Copyright © 2020 Kevin Oliveira. All rights reserved.
//

import XCTest

class APITests: XCTestCase {

    func testGetLoginUrl() {
        // GIVEN
        let endpoint: API.Endpoints = .login
        
        let expected = "https://bank-app-test.herokuapp.com/api/login"
        
        // WHEN
        let url = API.getURL(endpoint)

        // THEN
        XCTAssertEqual(url, expected)
    }

    func testGetListStatementsUrl() {
        // GIVEN
        let endpoint: API.Endpoints = .listStatements
        let parameters = ["userId": 1]

        let expected = "https://bank-app-test.herokuapp.com/api/statements/1"

        // WHEN
        let url = API.getURL(endpoint, parameters)

        // THEN
        XCTAssertEqual(url, expected)
    }
    
    func testGetListStatementsUrlWithoutUserId() {
        // GIVEN
        let endpoint: API.Endpoints = .listStatements

        // WHEN
        let url = API.getURL(endpoint)

        // THEN
        XCTAssertNil(url)
    }
}
