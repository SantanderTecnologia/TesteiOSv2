//
//  LoginPresenterTest.swift
//  Teste_iOS_v2Tests
//
//  Created by Lucas Fernandes Araujo on 04/08/20.
//  Copyright © 2020 Lucas Fernandes Araujo. All rights reserved.
//

import XCTest
@testable import Teste_iOS_v2

class LoginPresenterTest: XCTestCase {
    private lazy var viewControllerMock = LoginDisplayLogicMock()
    private lazy var sut: LoginPresentationLogic = LoginPresenter(viewController: viewControllerMock)
    
    override func setUp() {
        super.setUp()
        viewControllerMock.clearAllBooleans()
    }
    
    func testSuccessLogin() {
        sut.presentSuccessLogin(model: .init(response: .init(userAccount: nil, error: nil)))
        XCTAssert(viewControllerMock.displaySuccessLoginCalled)
    }
    
    func testUncompletedFieldsError() {
        sut.presentUncompletedFieldsError()
        XCTAssert(viewControllerMock.displayErrorLoginCalled)
    }
    
    func testWrongFieldsError() {
        sut.presentWrongFieldsError()
        XCTAssert(viewControllerMock.displayErrorLoginCalled)
    }
    
    func testAuthenticationError() {
        sut.presentAuthenticationError()
        XCTAssert(viewControllerMock.displayErrorLoginCalled)
    }
    
    func testLastLoggedUser() {
        sut.presentLastLoggedUser("")
        XCTAssert(viewControllerMock.displayLastLoggedUser)
    }
    
    
}
