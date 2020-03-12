//
//  LoginPresenterTests.swift
//  BankInterviewAppTests
//
//  Created by Osias Carneiro on 11/03/20.
//  Copyright © 2020 Osias Carneiro. All rights reserved.
//

import XCTest

class LoginPresenterTests: XCTestCase {
    
    let presenter = LoginPresenter()
    let spy = LoginDisplayLogicSpy()
    
    override func setUp() {
        presenter.viewController = spy
    }
    
    func testSucessLogin() {
        presenter.loginSucess(response: Login.Response(id: 1, name: "Joao dos testes", agency: "100", account: "123132", balance: 36.65))
        
        XCTAssert(spy.sucess != nil && spy.sucess!.id == 1)
    }
    
    func testErrorLogin() {
        presenter.error(error: Login.Error(message: "Error to be shown"))
        
        XCTAssert(spy.loginError != nil && spy.loginError!.message == "Error to be shown")
    }
    
}
