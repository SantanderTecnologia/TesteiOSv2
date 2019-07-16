//
//  LoginWorkerTest.swift
//  TestSantanderTests
//
//  Created by ely.assumpcao.ndiaye on 12/07/19.
//  Copyright © 2019 ely.assumpcao.ndiaye. All rights reserved.
//

import XCTest
@testable import TestSantander

class LoginWorkerTests: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        test_requestFromWorker()
    }
    
    func test_requestFromWorker() {
        let worker = LoginWorker()
        let sut = LoginInteractor()
        let username = "teste_user"
        let pass = "!QAZ2wsx"
        let expectation = self.expectation(description: "Scaling")
        worker.fetchUserID(user: username, pass: pass) { (useraccounts) in
            let response = LoginScene.Login.Response(userAccounts: useraccounts)
            print(useraccounts)
            sut.presenter?.presentUserAccounts(response: response)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 10, handler: nil)
    }
    
}
