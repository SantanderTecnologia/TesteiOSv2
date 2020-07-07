//
//  LoginPresenter+Tests.swift
//  Accenture-ChallengeTests
//
//  Created by Pedro Alvarez on 05/07/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

import XCTest
@testable import Accenture_Challenge

class LoginPresenter_Tests: XCTestCase {

    var sut: LoginPresenter!
    
    var didRouteToPayments = false
    
    var errorMessage: String!
    
    let emailErrorResponse = "Email inválido"
    let passwordErrorResponse = "Senha inválida"
    
    override func setUp() {
        sut = LoginPresenter()
        sut.viewController = self
    }
    
    override func tearDown() {
        sut = nil
    }
    
    func testDidFetchLoginResponse() {
        sut.didFetchLoginResponse()
        XCTAssertTrue(didRouteToPayments)
    }
    
    func testInvalidEmail() {
        sut.invalidEmailRequest()
        XCTAssertEqual(emailErrorResponse, errorMessage)
    }
    
    func testInvalidpassword() {
        sut.invalidpasswordRequest()
        XCTAssertEqual(passwordErrorResponse, errorMessage)
    }
    
    func testDidFetchError() {
        sut.didFetchError("Generic error")
        XCTAssertEqual(errorMessage, "Generic error")
    }
}

extension LoginPresenter_Tests: LoginDisplayLogic {
    
    func displayLoginInfo(_ response: Login.Saves.User) {
        
    }

    func routeToPayments() {
        didRouteToPayments = true
    }
    
    func displayLoginError(message: String) {
        errorMessage = message
    }
    
    func displayErrorAlert(message: String) {
        errorMessage = message
    }
}
