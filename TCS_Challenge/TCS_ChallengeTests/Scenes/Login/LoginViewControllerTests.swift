//
//  LoginViewControllerTests.swift
//  TCS_ChallengeTests
//
//  Created by Rafael Valer on 18/07/20.
//  Copyright © 2020 Rafael Valer. All rights reserved.
//

import XCTest
@testable import TCS_Challenge

class LoginViewControllerTests: XCTestCase {

    // MARK: - Subject under test
    
    var sut: LoginViewController!
    var window: UIWindow!
    
    // MARK: - Test lifecycle
    
    override func setUp() {
        super.setUp()
        window = UIWindow()
        setupLoginViewController()
    }
    
    override func tearDown() {
        window = nil
        super.tearDown()
    }
    
    // MARK: - Test setup
    
    func setupLoginViewController() {
        let bundle = Bundle.main
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        sut = storyboard.instantiateViewController(identifier: LoginViewController.identifier) as? LoginViewController
    }
    
    func loadView() {
        window.addSubview(sut.view)
        RunLoop.current.run(until: Date())
    }

    // MARK: - Test doubles
    
    class LoginBusinessLogicSpy: LoginBusinessLogic {

        // MARK: - Method call expectations
        var fetchLoginCalled = false
        var fetchLastLoggedUserCalled = false
        
        // MARK: - Spied methods
        func fetchLogin(_ request: Login.Fetch.Request) {
            fetchLoginCalled = true
        }
        
        func fetchLastLoggedUser() {
            fetchLastLoggedUserCalled = true
        }
    }
    
    // MARK: - Tests
    
    func testShouldFetchLastLoggedUserWhenViewWillAppear() {
        // Given
        let loginBusinessLogicSpy = LoginBusinessLogicSpy()
        sut.interactor = loginBusinessLogicSpy
        loadView()
        
        // When
        sut.viewWillAppear(true)
        
        // Then
        XCTAssert(loginBusinessLogicSpy.fetchLastLoggedUserCalled, "Should fetch last logged user after view will appear")
    }
    
    func testShouldDisplayFetchedLastLoggedUser() {
        // Given
        let loginBusinessLogicSpy = LoginBusinessLogicSpy()
        sut.interactor = loginBusinessLogicSpy
        loadView()
        
        // When
        let lastLoggedUser = "rafael@vaz.com"
        sut.displayLastLoggedUser(lastLoggedUser)
        
        // Then
        XCTAssertEqual(sut.userTextField!.text, lastLoggedUser, "Displaying fetched account info should update header view")
    }
}
