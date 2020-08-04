//
//  LoginInteractorTest.swift
//  Teste_iOS_v2Tests
//
//  Created by Lucas Fernandes Araujo on 04/08/20.
//  Copyright © 2020 Lucas Fernandes Araujo. All rights reserved.
//

import XCTest
@testable import Teste_iOS_v2

class LoginInteractorTest: XCTestCase {
    private lazy var presenterMock = LoginPresentationLogicMock()
    private lazy var workerMock = LoginWorkerLogicMock()
    private lazy var sut: LoginBusinessLogic = LoginInteractor(presenter: presenterMock, worker: workerMock)
    
    override func setUp() {
        super.setUp()
        presenterMock.clearAllBooleans()
        workerMock.clearAllBooleans()
    }
    
    func testValidLogin() {
        sut.validateLogin(username: "12345678909", password: "N@1")
        XCTAssert(workerMock.makeLoginCalled)
    }
    
    func testInvalidLogin() {
        sut.validateLogin(username: "dsdsder", password: "0192939")
        XCTAssert(presenterMock.presentWrongFieldsErrorCalled)
    }
    
    func testUncompletedLogin() {
        sut.validateLogin(username: "", password: "")
        XCTAssert(presenterMock.presentUncompletedFieldsErrorCalled)
    }
    
    func testRetrieveLastLoggedUser() {
        sut.retrieveLastLoggedUser()
        XCTAssert(workerMock.retrieveLastLoggedUserCalled)
    }
    
}
