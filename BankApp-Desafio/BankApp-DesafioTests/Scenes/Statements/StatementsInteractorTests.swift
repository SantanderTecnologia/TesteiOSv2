//
//  StatementsInteractorTests.swift
//  BankApp-DesafioTests
//
//  Created by Mizia Lima on 2/28/21.
//

import XCTest
@testable import BankApp_Desafio

class StatementsInteractorTests: XCTestCase {
    
    var sut: StatementsInteractor!
    var presenterMock: StatementsPresenterMock!
    var workerMock: StatementsWorkerMock!
    
    override func setUp() {
        self.workerMock = StatementsWorkerMock()
        self.sut = StatementsInteractor(worker: workerMock)
        self.presenterMock = StatementsPresenterMock()
        self.sut.presenter = presenterMock
    }
    
    func test_showStatements_when_worker_returns_success_then_presenter_should_present_statements_list() {
        let expectedUser = StatementsResponseMock.fetchStatements()
        workerMock.isSuccesCase = true
        sut.showStatements()
        
        XCTAssertTrue(workerMock.fetchStatementsIsCalled)
        XCTAssertNil(presenterMock.receivedMessage)
        XCTAssertFalse(presenterMock.presentErrorMessageWasCalled)
        XCTAssertEqual(presenterMock.receivedResponse?.statement.statementList.count, expectedUser.statement.statementList.count)
        XCTAssertEqual(presenterMock.receivedResponse?.statement.statementList[0].title, expectedUser.statement.statementList[0].title)
        XCTAssertEqual(presenterMock.receivedResponse?.statement.statementList[0].date, expectedUser.statement.statementList[0].date)
        XCTAssertEqual(presenterMock.receivedResponse?.statement.statementList[0].desc, expectedUser.statement.statementList[0].desc)
        XCTAssertEqual(presenterMock.receivedResponse?.statement.statementList[0].value, expectedUser.statement.statementList[0].value)
    }
    
    func test_showStatements_when_worker_returns_failure_then_presenter_should_present_error_message() {
        workerMock.isSuccesCase = false
        sut.showStatements()
        
        XCTAssertNil(presenterMock.receivedResponse?.statement.statementList)
        XCTAssertNotNil(presenterMock.receivedMessage)
        XCTAssertTrue(presenterMock.presentErrorMessageWasCalled)
    }
}
