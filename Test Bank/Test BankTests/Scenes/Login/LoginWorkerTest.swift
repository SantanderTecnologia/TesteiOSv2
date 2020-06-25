//
//  LoginWorkerTest.swift
//  Test BankTests
//
//  Created by Lucas Santana Brito on 24/06/20.
//  Copyright © 2020 lsb. All rights reserved.
//

import XCTest
@testable import Test_Bank

class LoginWorkerTest: XCTestCase {

    func testCompletionHandler() {
        let worker = LoginWorker()
        let expect = expectation(description: "It should call the completion handler")
        let request = Login.Request(user: "teste@teste.com", password: "1234@Password")
        var error: Login.ErrorLogin?
        var account: Login.UserAccount?
        
        worker.doLogin(request: request) { result in
            switch result {
            case .failure(let err):
                error = Login.ErrorLogin(code: 0, message: err.localizedDescription)
            case .success(let data):
                if let _ = data.error?.message {
                    error = data.error
                } else {
                    account = data.userAccount
                }
            }
            expect.fulfill()
        }
        
        waitForExpectations(timeout: 2) { (error) in
            print("Timeout error: \(error)")
        }
        
        XCTAssert(error?.code == nil && error?.message == nil)
        XCTAssert(account?.userId != nil &&
           account?.agency != nil &&
           account?.balance != nil &&
           account?.name != nil &&
           account?.bankAccount != nil)
    }
    
    func testCompletionHandlerFailure() {
        let worker = LoginWorker()
        let expect = expectation(description: "It should call the completion handler")
        let request = Login.Request(user: "", password: "")
        var error: Login.ErrorLogin?
        var account: Login.UserAccount?
        
        worker.doLogin(request: request) { result in
            switch result {
            case .failure(let err):
                error = Login.ErrorLogin(code: 0, message: err.localizedDescription)
            case .success(let data):
                if let _ = data.error?.message {
                    error = data.error
                } else {
                    account = data.userAccount
                }
            }
            expect.fulfill()
        }
        
        waitForExpectations(timeout: 2) { (error) in
            print("Timeout error: \(error)")
        }
        
        XCTAssert(error?.code == 53 && error?.message == "Usuário ou senha incorreta")
        XCTAssert(account?.userId == nil &&
           account?.agency == nil &&
           account?.balance == nil &&
           account?.name == nil &&
           account?.bankAccount == nil)
    }

}
