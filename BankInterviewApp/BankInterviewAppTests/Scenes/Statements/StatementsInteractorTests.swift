//
//  StatementsInteractorTests.swift
//  BankInterviewAppTests
//
//  Created by Osias Carneiro on 11/03/20.
//  Copyright © 2020 Osias Carneiro. All rights reserved.
//

import XCTest

class StatementsInteractorTests: XCTestCase {
    
    let interactor = StatementsInteractor()
    let spy = StatementsPresenterSpy()
    let keychainDbMock = LocalDbMock()
    
    override func setUp() {
        interactor.statementsWorker = FetchStatementsWorker(store: StatementAPIMock())
        interactor.presenter = spy
        interactor.localUserStore = keychainDbMock
    }
    
    func testSucessFetchStatements() {
        interactor.fetchStatements(request: Statements.StatementList.Request(userId: 1))
        
        XCTAssert(spy.statementsList != nil && spy.statementsList!.statements.count == 10)
    }
    
    func testFailFetchStatements() {
        interactor.fetchStatements(request: Statements.StatementList.Request(userId: 2))
        
        XCTAssert(spy.statementsList == nil)
    }
    
    func testDoLogout() {
        interactor.doLogout()
        
        XCTAssert(keychainDbMock.fetchUser() != nil && keychainDbMock.fetchUser() == "")
    }
    
}
