//
//  LoginPresenterTests.swift
//  BankAppTests
//
//  Created by Marcus Titton on 26/09/19.
//  Copyright © 2019 Marcus Titton. All rights reserved.
//

import XCTest
@testable import BankApp

class MockPresenterOutput: LoginDisplayLogic {
    var displayCalled = false
    
    func showStatement() {
        displayCalled = true
    }
}

class LoginPresenterTests: XCTestCase {

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
        let presenter = LoginPresenter()
        let output = MockPresenterOutput()
        
        presenter.viewController = output
        presenter.presentLogin()
        
        XCTAssert(output.displayCalled,
                  "Deve chamar a função que exibe o present")
    }
}
