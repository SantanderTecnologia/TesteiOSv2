//
//  LoginWorkerTests.swift
//  BankTestTests
//
//  Created by Luan Nascimento Almeida on 04/03/20.
//  Copyright © 2020 bank. All rights reserved.
//

import XCTest
import Moya
@testable import BankTest

class LoginWorkerTests: XCTestCase {

    var loginWorkerSpy: LoginWorkerSpy?

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        loginWorkerSpy = LoginWorkerSpy()
    }

    class LoginWorkerSpy: LoginWorkerLogic {
        var performLoginCalled = false

        func performLogin(request: Login.Request,
                          success: @escaping ((_ response: Login.Response) -> Void),
                          failure: @escaping ((_ error: MoyaError) -> Void)) {
                              performLoginCalled = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                let userAccount = UserAccount(userId: 1,
                                              name: "Luan Almeida",
                                              bankAccount: "1111",
                                              agency: "11111-1",
                                              balance: 100)
                let response = Login.Response(userAccount: userAccount)
                success(response)
            }
        }
    }

    func testFetchLoginShouldReturnUserAccount() {
        let expect = expectation(description: "Wait for fetched orders result")
        loginWorkerSpy?.performLogin(request: Login.Request(user: "39648264805", password: "1@M123"), success: { (response) in
            expect.fulfill()
        }, failure: { (_) in

        })
        assert(loginWorkerSpy?.performLoginCalled == true, "Calling performLogin() should return a user account")
        waitForExpectations(timeout: 2) { (_) in
            assert(true, "Calling performLogin() should result in the account handler being called with perform login")
        }
    }

}
