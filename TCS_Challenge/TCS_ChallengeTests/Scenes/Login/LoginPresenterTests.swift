//
//  LoginPresenterTests.swift
//  TCS_ChallengeTests
//
//  Created by Rafael Valer on 15/07/20.
//  Copyright © 2020 Rafael Valer. All rights reserved.
//

import XCTest
@testable import TCS_Challenge

class LoginPresenterTests: XCTestCase {
    
    // MARK: - Subject under test
    
    var sut: LoginPresenter!
    
    // MARK: - Test lifecycle
    
    override func setUp() {
        super.setUp()
        setupLoginPresenter()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: - Test setup
    
    func setupLoginPresenter() {
        sut = LoginPresenter()
    }
    
    // MARK: - Test doubles
    
    class LoginDisplayLogicSpy: LoginDisplayLogic {
        
        // MARK: Method call expectations
        var showAccountDetailsCalled = false
        var displayLastLoggedUserCalled = false
        var displayErrorMessageCalled = false
        
        // MARK: Argument expectations
        var user: String!
        var title: String!
        
        // MARK: Spied methods
        func showAccountDetails() {
            showAccountDetailsCalled = true
        }
        
        func displayLastLoggedUser(_ user: String) {
            displayLastLoggedUserCalled = true
            self.user = user
        }
        
        func displayErrorMessage(withTitle title: String, message: String) {
            displayErrorMessageCalled = true
            self.title = title
        }
    }
    
    // MARK: - Tests
    
    func testInvalidUser() {
        // Given
        let loginDisplayLogicSpy = LoginDisplayLogicSpy()
        sut.viewController = loginDisplayLogicSpy
        
        // When
        sut.presentInvalidUser()
        
        // Then
        XCTAssertEqual(loginDisplayLogicSpy.title, "Invalid User")
    }
    
    func testInvalidPassword() {
        // Given
        let loginDisplayLogicSpy = LoginDisplayLogicSpy()
        sut.viewController = loginDisplayLogicSpy
        
        // When
        sut.presentInvalidPassword()
        
        // Then
        XCTAssertEqual(loginDisplayLogicSpy.title, "Invalid Password")
        XCTAssert(loginDisplayLogicSpy.displayErrorMessageCalled, "Presenting error message should ask view controller to present message")
    }
    
    func testPresentFetchedLastLoggedUser() {
        // Given
        let loginDisplayLogicSpy = LoginDisplayLogicSpy()
        sut.viewController = loginDisplayLogicSpy
        
        // When
        let testEmail = "test@test.com"
        let response = Login.FetchLastLoggedUser.Response(user: testEmail)
        sut.presentLastLoggedUser(response: response)
        
        // Then
        XCTAssertEqual(loginDisplayLogicSpy.user, testEmail)
        XCTAssert(loginDisplayLogicSpy.displayLastLoggedUserCalled, "Presenting last logged user should ask view controller to display it")
    }
    
    func testPresentAccountDetailsShouldAskViewControllerToRouteToAccountDetails() {
        // Given
        let loginDisplayLogicSpy = LoginDisplayLogicSpy()
        sut.viewController = loginDisplayLogicSpy
        
        // When
        sut.presentAccountDetails()
        
        // Then
        XCTAssert(loginDisplayLogicSpy.showAccountDetailsCalled, "Presenting account details should ask view controller to route to Account Details View")
    }
}
