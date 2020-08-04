//
//  TimelinePresenterTest.swift
//  Teste_iOS_v2Tests
//
//  Created by Lucas Fernandes Araujo on 04/08/20.
//  Copyright © 2020 Lucas Fernandes Araujo. All rights reserved.
//

import XCTest
@testable import Teste_iOS_v2

class TimelinePresenterTest: XCTestCase {
    private lazy var viewControllerMock = TimelineDisplayLogicMock()
    private lazy var sut: TimelinePresentationLogic = TimelinePresenter(viewController: viewControllerMock)
    
    override func setUp() {
        super.setUp()
        viewControllerMock.clearAllBooleans()
    }
    
    func testDisplayList() {
        sut.presentTransactionList(model: .init(timelineList: []))
        XCTAssert(viewControllerMock.displayTransactionListCalled)
    }
    
    func testInitialState() {
        sut.presentInitialState(model: .init(userInformations: nil))
        XCTAssert(viewControllerMock.displayInitialStateCalled)
    }
}

