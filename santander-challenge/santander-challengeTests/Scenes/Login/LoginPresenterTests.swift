//
//  LoginPresenterTests.swift
//  santander-challengeTests
//
//  Created by Kevin Oliveira on 03/05/20.
//  Copyright © 2020 Kevin Oliveira. All rights reserved.
//

import XCTest

// MARK: - Test Doubles

class LoginViewControllerSpy: LoginDisplayLogic {
    var displayUserCalled = false
    var displayLoginCalled = false
    
    var displayedUser: String?
    var displayedLoginSuccess = false

    var displayedLoginErrorMessage: String?
    
    func displayUser(viewModel: Login.GetUser.ViewModel) {
        displayUserCalled = true
        displayedUser = viewModel.user
    }
    
    func displayLogin(viewModel: Login.Login.ViewModel) {
        displayLoginCalled = true
        displayedLoginSuccess = viewModel.success
        displayedLoginErrorMessage = viewModel.errorMessage
    }
}

// MARK: - Tests

class LoginPresenterTests: XCTestCase {

    func testPresentUser() {
        // GIVEN
        let viewControllerSpy = LoginViewControllerSpy()

        let presenter = LoginPresenter()
        presenter.viewController = viewControllerSpy
        
        let response = Login.GetUser.Response(user: "foo@email.com")

        // WHEN
        presenter.presentUser(response: response)

        // THEN
        XCTAssertTrue(viewControllerSpy.displayUserCalled)
        XCTAssertEqual(viewControllerSpy.displayedUser, "foo@email.com")
    }

    func testPresentLoginWithSuccess() {
        // GIVEN
        let viewControllerSpy = LoginViewControllerSpy()

        let presenter = LoginPresenter()
        presenter.viewController = viewControllerSpy
        
        let response = Login.Login.Response(success: true, errorMessage: nil)

        // WHEN
        presenter.presentLogin(response: response)

        // THEN
        XCTAssertTrue(viewControllerSpy.displayLoginCalled)
        XCTAssertTrue(viewControllerSpy.displayedLoginSuccess)
        XCTAssertNil(viewControllerSpy.displayedLoginErrorMessage)
    }

    func testPresentLoginWithError() {
        // GIVEN
        let viewControllerSpy = LoginViewControllerSpy()

        let presenter = LoginPresenter()
        presenter.viewController = viewControllerSpy
        
        let errorMessage = "Não foi possível completar seu login."
        let response = Login.Login.Response(success: false, errorMessage: errorMessage)

        // WHEN
        presenter.presentLogin(response: response)

        // THEN
        XCTAssertTrue(viewControllerSpy.displayLoginCalled)
        XCTAssertFalse(viewControllerSpy.displayedLoginSuccess)
        XCTAssertEqual(viewControllerSpy.displayedLoginErrorMessage, errorMessage)
    }
}
