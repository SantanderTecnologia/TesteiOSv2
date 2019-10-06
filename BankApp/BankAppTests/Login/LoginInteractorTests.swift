//
//  LoginInteractorTest.swift
//  BankAppTests
//
//  Created by Victor Hugo Martins Lisboa on 02/10/19.
//  Copyright © 2019 Victor Lisboa. All rights reserved.
//

import XCTest
@testable import BankApp

class MockLoginWorker: LoginWorker {
    
    var isLoginCalled = false
    var response: Login.Something.Response?
    
    override func doLoginWork(user: String, password: String, completion: @escaping((Login.Something.Response) -> Void)) {
        isLoginCalled = true

        let userAccount = Login.Something.UserAccount(userId: 1, name: "José da Silva", bankAccount: "1234", agency: "567890", balance: 4.15)
        
        response = Login.Something.Response(userAccount: userAccount, error: nil)
        
        completion(response!)
    }
}

class LoginPresentationLogicSpy: LoginPresentationLogic {
    var isLoginCalled = false
    func presentLogin() {
        isLoginCalled = true
    }
}

class LoginInteractorTests: XCTestCase {

    var user: String?
    var password: String?
    var sut: LoginInteractor?
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        user = "Test@clean.swift"
        password = "Test@1"
        sut = LoginInteractor()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInteractor() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.

        let mockWorker = MockLoginWorker()
        let spy = LoginPresentationLogicSpy()
        var request = Login.Something.Request()

        request.user = user
        request.password = password

        sut?.worker = mockWorker
        sut?.presenter = spy
        sut?.doLogin(request: request)

        XCTAssert(spy.isLoginCalled)
        
        XCTAssert(mockWorker.isLoginCalled)
        
        XCTAssertNotNil(mockWorker.response)
    }


    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
