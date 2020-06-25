//
//  LoginPresenterTest.swift
//  Test BankTests
//
//  Created by Lucas Santana Brito on 24/06/20.
//  Copyright © 2020 lsb. All rights reserved.
//

import XCTest
@testable import Test_Bank

class MockLoginPresenterOutput: LoginDisplayLogic {
    var showErrorLabelCalled = false
    var hideErrorLabelCalled = false
    var viewModel: Login.ViewModel?
    
    func showErrorLabel(viewModel: Login.ViewModel) {
        showErrorLabelCalled = true
        self.viewModel = viewModel
    }
    
    func hideErrorLabel() {
        hideErrorLabelCalled = true
    }
   
}

class LoginPresenterTest: XCTestCase {
    
    func testPresentError() {
        let presenter = LoginPresenter()
        let output = MockLoginPresenterOutput()
        presenter.viewController = output
        
        let errorLogin = Login.ErrorLogin(code: 0, message: "Usuário ou senha incorreta")
        let response = Login.Response(error: errorLogin, userAccount: nil)
        presenter.presentSomething(response: response)
        
        XCTAssert(output.showErrorLabelCalled,
                  "It should have called showError")
    }
    
    func testHideError() {
        let presenter = LoginPresenter()
        let output = MockLoginPresenterOutput()
        presenter.viewController = output
        
        let userAccount = Login.UserAccount(userId: 1, name: "Jose da Silva Teste", bankAccount: "2050", agency: "012314564", balance: 3.3445)
        let response = Login.Response(error: nil, userAccount: userAccount)
        presenter.presentSomething(response: response)
        
        XCTAssert(output.hideErrorLabelCalled,
                  "It should have called showError")
    }

}
