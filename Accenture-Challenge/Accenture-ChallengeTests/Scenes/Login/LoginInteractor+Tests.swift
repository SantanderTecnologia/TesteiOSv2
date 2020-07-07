//
//  LoginInteractor+Tests.swift
//  Accenture-ChallengeTests
//
//  Created by Pedro Alvarez on 05/07/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

import XCTest
@testable import Accenture_Challenge

class LoginInteractor_Tests: XCTestCase {

    var sut: LoginInteractor!
    
    var dataStore: Login.Info.LoginResponse!
    
    var viewController: LoginDisplayLogic?
    
    var wrongUser: Bool = false
    var passwordWrong: Bool = false
    
    override func setUp() {
        sut = LoginInteractor(viewController: LoginViewController(),
                              presenter: self,
                              worker: LoginWorkerMock())
    }
    
    override func tearDown() {
        sut = nil
    }
    
    func testFetchLogin_Success() {
        sut.fetchLogin(Login.Info.LoginRequest(user: "test_user@hotmail.com", password: "Test@1"))
        let expectedResult = 1
        let testable = dataStore.userId
        XCTAssertEqual(testable, expectedResult)
    }
    
    func testFetchLogin_WrongUser() {
        sut.fetchLogin(Login.Info.LoginRequest(user: "test_user", password: "Test@1"))
        XCTAssertTrue(wrongUser)
    }
    
    func testFetchLogin_Wrongpassword() {
        sut.fetchLogin(Login.Info.LoginRequest(user: "test_user@hotmail.com", password: "Test1"))
        XCTAssertTrue(passwordWrong)
    }
}

extension LoginInteractor_Tests: LoginPresentationLogic {
    
    func didFetchLoginInfo(_ response: Login.Saves.User) {
        
    }

    func didFetchLoginResponse() {
        dataStore = sut.loginResponse
    }
    
    func invalidEmailRequest() {
        wrongUser = true
    }
    
    func invalidpasswordRequest() {
        passwordWrong = true
    }
    
    func didFetchError(_ errorMessage: String) {
        
    }
}
