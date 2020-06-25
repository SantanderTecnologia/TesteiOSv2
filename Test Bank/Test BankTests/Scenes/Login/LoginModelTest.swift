//
//  LoginModelTest.swift
//  Test BankTests
//
//  Created by Lucas Santana Brito on 24/06/20.
//  Copyright © 2020 lsb. All rights reserved.
//

import XCTest

@testable import Test_Bank

class LoginModelTest: XCTestCase {

    func testInicializationRequest() {
        let request = Login.Request(user: "test_user", password: "Test@1")
        
        XCTAssert(request.user == "test_user",
                  "It should have set the user")
        XCTAssert(request.password == "Test@1",
                  "It should have set the password")
    }
    
    func testInicializationResponse() {
        let errorLogin = Login.ErrorLogin(code: 0, message: "Usuário ou senha incorreta")
        let userAccount = Login.UserAccount(userId: 1, name: "Jose da Silva Teste", bankAccount: "2050", agency: "012314564", balance: 3.3445)
        
        let response = Login.Response(error: errorLogin, userAccount: userAccount)
        
        XCTAssert(response.error?.code == errorLogin.code,
                  "It should have set the error code")
        XCTAssert(response.error?.message == "Usuário ou senha incorreta",
                  "It should have set the error message")
        
        XCTAssert(response.userAccount?.userId == userAccount.userId,
                  "It should have set the userID")
        XCTAssert(response.userAccount?.name == userAccount.name,
                  "It should have set the name")
        XCTAssert(response.userAccount?.bankAccount == userAccount.bankAccount,
                  "It should have set the bankAccount")
        XCTAssert(response.userAccount?.balance == userAccount.balance,
                  "It should have set the balance")
    }
    
    func testInicializationViewModel() {
        let userAccount = Login.UserAccount(userId: 1, name: "Jose da Silva Teste", bankAccount: "2050", agency: "012314564", balance: 3.3445)
        let viewModel = Login.ViewModel(errorMesage: "Usuário ou senha incorreta", userAccount: userAccount)

        XCTAssert(viewModel.errorMesage == "Usuário ou senha incorreta",
                  "It should have set the errorMessage")
        XCTAssert(viewModel.userAccount?.userId == userAccount.userId,
                  "It should have set the userId")
        XCTAssert(viewModel.userAccount?.name == userAccount.name,
                  "It should have set the name")
        XCTAssert(viewModel.userAccount?.bankAccount == userAccount.bankAccount,
                  "It should have set the bankAccount")
        XCTAssert(viewModel.userAccount?.balance == userAccount.balance,
                  "It should have set the balance")
    }
}
