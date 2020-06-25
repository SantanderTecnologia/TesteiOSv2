//
//  LoginInteractorTest.swift
//  Test BankTests
//
//  Created by Lucas Santana Brito on 24/06/20.
//  Copyright © 2020 lsb. All rights reserved.
//

import XCTest
@testable import Test_Bank

class MockLoginWorker: LoginWorker {
    var doLoginCalled = false
    var requestParameter: Login.Request?
    
    override func doLogin(request: Login.Request, completion: @escaping (ApiResult<Login.Response>) -> Void) {
        doLoginCalled = true
        requestParameter = request
    }
}

class LoginInteractorTest: XCTestCase {

    func testCallingWorker() {
        // Arrange
        let interactor = LoginInteractor()
        let worker = MockLoginWorker()
        interactor.worker = worker

        // Act
        interactor.doLogin(request: Login.Request(user: "test_user@email.com", password: "Test@1"))

        // Assert
        XCTAssert(worker.doLoginCalled,
                  "It should have called doLogin()")
    }
    
    func testPassingParameter() {
        // Arrange
        let interactor = LoginInteractor()
        let worker = MockLoginWorker()
        interactor.worker = worker
        let request = Login.Request(user: "test_user@email.com", password: "Test@1")
        
        // Act
        interactor.doLogin(request: request)

        // Assert
        XCTAssert(worker.requestParameter?.user == request.user,
                  "It should have called with the right user")
        XCTAssert(worker.requestParameter?.password == request.password,
                  "It should have called with the right user")
    }
    
    func testIfUserAndPasswordIsValidate() {
        let interactor = LoginInteractor()
        
        let request = Login.Request(user: "teste1", password: "123@Test")
        let isValided = interactor.checkIfUserAndPasswordValidate(request: request)
        
        XCTAssert(isValided == false,
                  "It should have return false")
        
        let request2 = Login.Request(user: "teste_user@email.com", password: "123@Test")
        let isValided2 = interactor.checkIfUserAndPasswordValidate(request: request2)
        
        XCTAssert(isValided2 == true,
                  "It should have return true")
    }

}
