//
//  HomeInteractorTest.swift
//  Test BankTests
//
//  Created by Lucas Santana Brito on 24/06/20.
//  Copyright © 2020 lsb. All rights reserved.
//

import XCTest
@testable import Test_Bank

class MockHomeWorker: HomeWorker {
    var getStatementsCalled = false
    
    override func getListStatements(userId: Int, completion: @escaping (ApiResult<Home.StatementResponse>) -> Void) {
        getStatementsCalled = true
    }
}

class HomeInteractorTest: XCTestCase {

    func testCallingWorker() {
        // Arrange
        let interactor = HomeInteractor()
        let worker = MockHomeWorker()
        interactor.worker = worker
        let account = Login.UserAccount(userId: 1, name: "Jose da Silva Teste", bankAccount: "2050", agency: "012314564", balance: 3.3445)
        interactor.account = account

        // Act
        interactor.getStatements()

        // Assert
        XCTAssert(worker.getStatementsCalled,
                  "It should have called doLogin()")
    }

}
