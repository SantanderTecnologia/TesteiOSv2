//
//  HomePresenterTest.swift
//  Test BankTests
//
//  Created by Lucas Santana Brito on 24/06/20.
//  Copyright © 2020 lsb. All rights reserved.
//

import XCTest
@testable import Test_Bank

class MockHomePresenterOutput: HomeDisplayLogic {
    var displayAccountCalled = false
    var displayStatementsCalled = false
    var displayErrorGetStatementsCalled = false
    var viewModel: Home.ViewModel?
    var list: [Home.Statement]?
    var errorMessage: String?
    
    func displayAccount(viewModel: Home.ViewModel) {
        displayAccountCalled = true
        self.viewModel = viewModel
    }
    
    func displayStatements(list: [Home.Statement]) {
        displayStatementsCalled = true
        self.list = list
    }
    
    func displayErrorGetStatements(errorMessage: String) {
        displayErrorGetStatementsCalled = true
        self.errorMessage = errorMessage
    }
    
   
}

class HomePresenterTest: XCTestCase {

    func testDisplayAccount() {
        let presenter = HomePresenter()
        let output = MockHomePresenterOutput()
        presenter.viewController = output
        
        let account = Login.UserAccount(userId: 1, name: "Jose da Silva Teste", bankAccount: "2050", agency: "012314564", balance: 3.3445)
        let response = Home.Response(account: account)
        presenter.presentAccount(response: response)
        
        XCTAssert(output.displayAccountCalled,
                  "It should have called display account")
    }
    
    func testDisplayStatement() {
        let presenter = HomePresenter()
        let output = MockHomePresenterOutput()
        presenter.viewController = output
        
        presenter.presentStatements(list: [
            Home.Statement(title: "Pagamento", desc: "Conta de luz", date: "2018-08-15", value: -50),
            Home.Statement(title: "Pagamento", desc: "Conta de luz", date: "2018-08-15", value: -50),
            Home.Statement(title: "Pagamento", desc: "Conta de luz", date: "2018-08-15", value: -50)
        ])
        
        XCTAssert(output.displayStatementsCalled,
                  "It should have called showError")
    }

}
