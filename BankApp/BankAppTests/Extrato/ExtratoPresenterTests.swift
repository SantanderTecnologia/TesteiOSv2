//
//  ExtratoPresenterTests.swift
//  BankAppTests
//
//  Created by Victor Hugo Martins Lisboa on 02/10/19.
//  Copyright © 2019 Victor Lisboa. All rights reserved.
//

import XCTest
@testable import BankApp

class ExtratoDisplayLogicSpy: ExtratoDisplayLogic {
    var isDisplayCalled = false
    func displayStatementList(responseExtrato: Extrato.Something.Response) {
        isDisplayCalled = true
    }
}

class ExtratoPresenterTests: XCTestCase {
    
    var presenter: ExtratoPresenter?
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        presenter = ExtratoPresenter()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPresenter() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.let
        let spy = ExtratoDisplayLogicSpy()
        
        let statements = [Extrato.Something.Statement(title: "Pagamento", desc: "Luz", date: "2019-09-17", value: -130.54), Extrato.Something.Statement(title: "Pagamento", desc: "Faculdade", date: "2019-09-10", value: 500.0)]
        
        let response = Extrato.Something.Response(statementList: statements, error: nil)
        
        
        presenter?.viewController = spy
        presenter?.presentSomething(response: response)
        
        XCTAssert(spy.isDisplayCalled)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
