//
//  BankAppTests.swift
//  BankAppTests
//
//  Created by Visão Grupo on 7/20/19.
//  Copyright © 2019 Vinicius Teixeira. All rights reserved.
//

import XCTest
@testable import BankApp

class BankAppTests: XCTestCase {

    func testInvalidPassword() {
        let password = "vinicius"
        XCTAssertEqual(password.validate().valid, true)
    }
    
    func testInvalidPasswordNumbers() {
        let password = "1005"
        XCTAssertEqual(password.validate().valid, true)
    }
    
    func testInvalidPasswordLowerCase() {
        let password = "vinicius10-05"
        XCTAssertEqual(password.validate().valid, true)
    }
    
    func testValidPassword() {
        let password = "Vinicius10-05"
        XCTAssertEqual(password.validate().valid, true)
    }

}
