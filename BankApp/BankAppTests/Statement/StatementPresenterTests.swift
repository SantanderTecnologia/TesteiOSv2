//
//  StatementPresenterTests.swift
//  BankAppTests
//
//  Created by Marcus Titton on 26/09/19.
//  Copyright © 2019 Marcus Titton. All rights reserved.
//

import XCTest
@testable import BankApp

class MockPresenterStatement: StatementDisplayLogic {
    var displayCalled = false
    
    func showStatement(statements: Statement.StatementApi.Response) {
        displayCalled = true
    }
}

class StatementPresenterTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    //Teste que verifica se o presenter que chama a tela de extrato está sendo chamado
    func testCallingOutput() {
        let presenter = StatementPresenter()
        let output = MockPresenterStatement()
        
        let statementTest1 = StatementUser.init(title: "Teste 1", desc: "Teste 1", date: "Teste 1", value: 01.2)
        let statementTest2 = StatementUser.init(title: "Teste 2", desc: "Teste 2", date: "Teste 2", value: 02.3)
        
        let statements = [statementTest1, statementTest2]
        let response = Statement.StatementApi.Response(statement: statements)
        
        presenter.viewController = output
        presenter.presentStatement(response)
        
        XCTAssert(output.displayCalled,
                  "Deve chamar a função que exibe o present")
    }
}
