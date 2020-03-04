//
//  LoginInteractorTests.swift
//  BankTestTests
//
//  Created by Luan Nascimento Almeida on 04/03/20.
//  Copyright © 2020 bank. All rights reserved.
//

import XCTest
@testable import BankTest

class LoginInteractorTests: XCTestCase {

    var loginInteractorSpy: LoginInteractorSpy?

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        loginInteractorSpy = LoginInteractorSpy()
    }

    class LoginInteractorSpy: LoginBusinessLogic {
        var performLoginCalled = false
        func performLogin(request: Login.Request) {
            performLoginCalled = true
        }
    }

    func testPerformLoginAndCalledWithSuccess() {
        loginInteractorSpy?.performLogin(request: Login.Request(user: "39648264805", password: "1@M123"))
        assert(loginInteractorSpy?.performLoginCalled == true, "Login method should called")
    }
}
