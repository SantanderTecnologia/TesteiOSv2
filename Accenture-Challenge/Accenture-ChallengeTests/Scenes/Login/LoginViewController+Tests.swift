//
//  LoginViewController+Tests.swift
//  Accenture-ChallengeTests
//
//  Created by Pedro Alvarez on 05/07/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

import XCTest
@testable import Accenture_Challenge

class LoginViewController_Tests: XCTestCase, LoginDataTransfer {

    var sut: LoginViewController!
    
    var routed = false
    
    var dataStore: LoginDataStore?
    
    override func setUp() {
        sut = LoginViewController()
        sut.router = self
    }
    
    override func tearDown() {
        sut = nil
    }
    
    func testRouteToPayments() {
        sut.routeToPayments()
        XCTAssertTrue(routed)
    }
}

extension LoginViewController_Tests: LoginRoutingLogic {

    func routeToPayments() {
        routed = true
    }
}
