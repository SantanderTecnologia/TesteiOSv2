//
//  StatementsPresenterTests.swift
//  BankInterviewAppTests
//
//  Created by Osias Carneiro on 11/03/20.
//  Copyright © 2020 Osias Carneiro. All rights reserved.
//

import XCTest

class StatementsPresenterTests: XCTestCase {
    
    let presenter = StatementsPresenter()
    let spy = StatementsDisplayLogicSpy()
    
    override func setUp() {
        presenter.viewController = spy
    }
    
    func testDisplayFetchedStatements() {
        let vm = Statements.StatementList.ViewModel(statements: [])
        presenter.presentFetchedStatements(response: vm)
        
        XCTAssert(spy.list != nil && spy.list!.statements.isEmpty)
    }
    
}
