//
//  TimelineViewControllerTest.swift
//  Teste_iOS_v2Tests
//
//  Created by Lucas Fernandes Araujo on 04/08/20.
//  Copyright © 2020 Lucas Fernandes Araujo. All rights reserved.
//

import XCTest
@testable import Teste_iOS_v2

class TimelineViewControllerTest: XCTestCase {
    private lazy var interactorMock = TimelineBusinessLogicMock()
    private lazy var sut = TimelineViewController()
    
    override func setUp() {
        super.setUp()
        interactorMock.clearAllBooleans()
        sut.interactor = interactorMock
        UIApplication.shared.keyWindow?.rootViewController = sut
    }
    
    func testInitialState() {
        sut.viewDidLoad()
        XCTAssert(interactorMock.setupInitialStateCalled)
    }
    
    func testTransactionList() {
        sut.viewDidLoad()
        XCTAssert(interactorMock.getTransactionsCalled)
    }
}
