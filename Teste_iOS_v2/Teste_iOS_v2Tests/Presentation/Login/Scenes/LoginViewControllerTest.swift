//
//  LoginViewControllerTest.swift
//  Teste_iOS_v2Tests
//
//  Created by Lucas Fernandes Araujo on 04/08/20.
//  Copyright © 2020 Lucas Fernandes Araujo. All rights reserved.
//

import XCTest
@testable import Teste_iOS_v2

class LoginViewControllerTest: XCTestCase {
    private lazy var interactorMock = LoginBusinessLogicMock()
    private lazy var sut = LoginViewController()
    
    override func setUp() {
        super.setUp()
        sut.interactor = interactorMock
        UIApplication.shared.keyWindow?.rootViewController = sut
    }
    
    func testRetrieveLastUser() {
        sut.viewDidLoad()
        XCTAssert(interactorMock.retrieveLastLoggedUserCalled)
    }


}
