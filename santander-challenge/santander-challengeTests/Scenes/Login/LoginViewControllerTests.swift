//
//  LoginViewControllerTests.swift
//  santander-challengeTests
//
//  Created by Kevin Oliveira on 03/05/20.
//  Copyright © 2020 Kevin Oliveira. All rights reserved.
//

import XCTest

// MARK: - Test Doubles

class LoginInteractorSpy: LoginBusinessLogic, LoginDataStore {
    var getUserCalled = false
    var loginCalled = false
    
    var user: User?

    func getUser(request: Login.GetUser.Request) {
        getUserCalled = true
    }

    func login(request: Login.Login.Request) {
        loginCalled = true
    }
}

// MARK: - Tests

class LoginViewControllerTests: XCTestCase {

    func testGetUserCalledWhenViewDidLoad() {
        // GIVEN
        let interactorSpy = LoginInteractorSpy()

        let viewController = LoginViewController()
        viewController.interactor = interactorSpy
        
        viewController.beginAppearanceTransition(true, animated: false)
        viewController.endAppearanceTransition()

        // WHEN
        viewController.viewDidLoad()

        // THEN
        XCTAssertTrue(interactorSpy.getUserCalled)
    }

    func testDisplayUser() {
        // GIVEN
        let viewController = LoginViewController()
        
        let textFieldSpy = TextFieldSpy()
        viewController.userTextField = textFieldSpy

        viewController.beginAppearanceTransition(true, animated: false)
        viewController.endAppearanceTransition()
        
        let viewModel = Login.GetUser.ViewModel(user: "foo@email.com")

        // WHEN
        viewController.displayUser(viewModel: viewModel)

        // THEN
        XCTAssertEqual(viewController.userTextField.text, "foo@email.com")
    }
}
