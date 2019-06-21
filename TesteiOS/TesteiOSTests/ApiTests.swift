//
//  ApiTests.swift
//  TesteiOSTests
//
//  Created by Fernando Gomes on 19/06/19.
//  Copyright © 2019 Fernando Gomes. All rights reserved.
//

import XCTest
@testable import TesteiOS

class ApiTests: XCTestCase {
    var userAccount: UserAccount!
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
            testLogin()
            testGetStatement()
        }
    }
    
    func testLogin() {
        RestApi.doLogin(user: "teste@teste.com", password: "Teste@1", callback: { response in
            let response = Login.doLogin.Response(userAccount: response!, error: nil)
            self.userAccount = response.userAccount
            XCTAssertNotNil(response.userAccount)
            XCTAssertEqual(response.userAccount?.name, "Jose da Silva Teste")
            XCTAssertEqual(response.userAccount?.balance, 3.3445)
            XCTAssertEqual(response.userAccount?.bankAccount, "2050")
            XCTAssertEqual(response.userAccount?.agency, "012314564")
            XCTAssertEqual(response.userAccount?.userId, 1)
        }, error: {})
    }
    
    func testGetStatement() {
        RestApi.getStatement(id: "1", callback: {
            response in
            let response = Statements.get.Response(userAccount: self.userAccount, statements: response?.statementList)
            XCTAssertNotNil(response.statements)
            let statement: Statement = response.statements![0]
            XCTAssertEqual(statement.title, "Pagamento")
            XCTAssertEqual(statement.description, "Conta de luz")
            XCTAssertEqual(statement.date, "2018-08-15")
            XCTAssertEqual(statement.value, -50)
        }, error: {
            
        })
    }

}
