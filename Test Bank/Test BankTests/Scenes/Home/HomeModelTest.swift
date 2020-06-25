//
//  HomeModelTest.swift
//  Test BankTests
//
//  Created by Lucas Santana Brito on 24/06/20.
//  Copyright © 2020 lsb. All rights reserved.
//

import XCTest

@testable import Test_Bank

class HomeModelTest: XCTestCase {
    
    func testInicializationResponse() {
        let userAccount = Login.UserAccount(userId: 1, name: "Jose da Silva Teste", bankAccount: "2050", agency: "012314564", balance: 3.3445)
        
        let response = Home.Response(account: userAccount)
        
        XCTAssert(response.account?.userId == userAccount.userId,
                  "It should have set the userID")
        XCTAssert(response.account?.name == userAccount.name,
                  "It should have set the name")
        XCTAssert(response.account?.bankAccount == userAccount.bankAccount,
                  "It should have set the bankAccount")
        XCTAssert(response.account?.balance == userAccount.balance,
                  "It should have set the balance")
    }
    
    func testInicializationViewModel() {
        let viewModel = Home.ViewModel(name: "Jose da Silva Teste", bankAccount: "2050", agency: "012314564", balance: 3.3445, statmentList: [])

        XCTAssert(viewModel.name == "Jose da Silva Teste",
                  "It should have set the name")
        XCTAssert(viewModel.bankAccount == "2050",
                  "It should have set the bankAccount")
        XCTAssert(viewModel.agency == "012314564",
                  "Itshould have set the agency")
        XCTAssert(viewModel.balance == 3.3445,
                  "It should have set the balance")
        XCTAssert(viewModel.statmentList!.isEmpty,
                  "It should have set the empty list")
    }

}
