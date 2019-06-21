//
//  LoginWorkerTests.swift
//  TesteiOSTests
//
//  Created by Fernando Gomes on 19/06/19.
//  Copyright © 2019 Fernando Gomes. All rights reserved.
//

import XCTest
import ObjectMapper
@testable import TesteiOS

class LoginWorkerTests: XCTestCase {

    var loginWorker: LoginWorker!
    var loginRequest: Login.doLogin.Request!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        loginWorker = LoginWorker()
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        loginRequest = nil
    }
    
    func testWrongUserLogin() {
        loginRequest = Login.doLogin.Request.init(user: "t", password: "Teste@1")
        loginWorker.doLogin(request: loginRequest, callback: {
            response in
            XCTAssertNil(response?.userAccount)
            XCTAssertNotNil(response?.error)
            XCTAssertEqual(response?.error, ["Login failed": "You have entered an invalid email / CPF or password"])
        })
    }
    
    func testWrongPasswordLogin() {
        loginRequest = Login.doLogin.Request.init(user: "teste@teste", password: "1")
        loginWorker.doLogin(request: loginRequest, callback: {
            response in
            XCTAssertNil(response?.userAccount)
            XCTAssertNotNil(response?.error)
            XCTAssertEqual(response?.error, ["Login failed": "You have entered an invalid email / CPF or password"])
        })
    }
    
    func testCorrectLogin() {
        loginRequest = Login.doLogin.Request.init(user: "teste@teste.com", password: "Teste@1")
        loginWorker.doLogin(request: loginRequest, callback: {
                        response in
                        XCTAssertNotNil(response?.userAccount)
                        XCTAssertEqual(response?.userAccount?.name, "Jose da Silva Teste")
                        XCTAssertEqual(response?.userAccount?.balance, 3.3445)
                        XCTAssertEqual(response?.userAccount?.bankAccount, "2050")
                        XCTAssertEqual(response?.userAccount?.agency, "012314564")
                        XCTAssertEqual(response?.userAccount?.userId, 1)
            
                    })
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
