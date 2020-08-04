//
//  TimelineInteractorTest.swift
//  Teste_iOS_v2Tests
//
//  Created by Lucas Fernandes Araujo on 04/08/20.
//  Copyright © 2020 Lucas Fernandes Araujo. All rights reserved.
//

import XCTest
@testable import Teste_iOS_v2

class TimelineInteractorTest: XCTestCase {
    private lazy var presenterMock = TimelinePresentationLogicMock()
    private lazy var workerMock = TimelineWorkerLogicMock()
    private lazy var sut: TimelineBusinessLogic = TimelineInteractor(presenter: presenterMock, worker: workerMock, userInformations: nil)
    
    override func setUp() {
        super.setUp()
        presenterMock.clearAllBooleans()
        workerMock.clearAllBooleans()
    }
    
    func testGetTransaction() {
        sut.getTransactions()
        XCTAssert(workerMock.retrieveTransactionCalled)
    }
    
    func testSetupInitialState() {
        sut.setupInitialState()
        XCTAssert(presenterMock.presentInitialStateCalled)
    }
}
