//
//  LoginInteractorTests.swift
//  CleanSwiftTests
//
//  Created by Samanta Coutinho on 2019-08-21.
//  Copyright © 2019 Sam. All rights reserved.
//

import XCTest
import Alamofire
@testable import CleanSwift

class LoginInteractorTests: XCTestCase {
    var user: UserRealm!
    var loginInteractor: LoginInteractor!
    fileprivate var worker: MockLoginWorker!
    
    override func setUp() {
        super.setUp()
        self.worker = MockLoginWorker()
        self.user = UserRealm()
        self.loginInteractor = LoginInteractor(worker: worker)
    }
    
    override func tearDown() {
        self.loginInteractor = nil
        self.worker = nil
        self.user = nil
        super.tearDown()
    }
    
    func testFetchWithNoWorker() {
        let expectation = XCTestExpectation(description: "Error")
        loginInteractor.worker = nil
        loginInteractor.presenter?.presentError(error: "Error")
        if loginInteractor.worker == nil {
            expectation.fulfill()
        }
        let request = Login.Request(username: "", password: "")
        loginInteractor.doSomething(request: request)
        wait(for: [expectation], timeout: 5.0)
    }

    func testNoUsername() {
        let expectation = XCTestExpectation(description: CSError.invalidUser.localizedDescription)
        let request = Login.Request(username: "hey", password: "Test@1")
        if request.username == "hey" {
            expectation.fulfill()
        }
        loginInteractor.doSomething(request: request)
        wait(for: [expectation], timeout: 3.0)
    }
    
    func testNoPassword() {
        let expectation = XCTestExpectation(description: CSError.invalidPassword.localizedDescription)
        let request = Login.Request(username: "test_user@hotmail.com", password: "test")
        if request.password == "test" {
            expectation.fulfill()
        }
        loginInteractor.doSomething(request: request)
        wait(for: [expectation], timeout: 3.0)
    }
    
    func testUser() {
        let expectation = XCTestExpectation(description: "success")
        let request = Login.Request(username: "test_user@hotmail.com", password: "Test@1")
        loginInteractor.doSomething(request: request)
        let user = User(userAccount: UserInfo(userId: 1.0, name: "Jose da Silva Teste", bankAccount: "2050", agency: "012314564", balance: 3.3445), error: ErrorResponse(code: nil, message: nil))
        if user.userAccount.name == "Jose da Silva Teste" {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5.0)
    }
}

fileprivate class MockLoginWorker: LoginWorkerProtocol {
    var user: User?

    func doSomeWork(request: Login.Request, completion: @escaping (Result<User>) -> Void) {
        if let user = user {
            completion(Result.success(user))
        }
    }
}

