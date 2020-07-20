//
//  LoginInteractorTests.swift
//  TCS_ChallengeTests
//
//  Created by Rafael Valer on 15/07/20.
//  Copyright © 2020 Rafael Valer. All rights reserved.
//

@testable import TCS_Challenge
import XCTest

class LoginInteractorTests: XCTestCase {
    
    // MARK: - Subject under test
    var sut: LoginInteractor!
    
    // MARK: - Test lifecycle
    
    override func setUp() {
        super.setUp()
        setupLoginInteractor()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: - Test setup
    
    func setupLoginInteractor() {
        sut = LoginInteractor()
    }
    
    // MARK: - Test doubles
    
    class LoginPresentationLogicSpy: LoginPresentationLogic {
        
        // MARK: Method call expectations
        var presentAccountDetailsCalled = false
        var presentInvalidUserCalled = false
        var presentInvalidPasswordCalled = false
        var presentLastLoggedUserCalled = false
        
        // MARK: Argument expectations
        var lastLoggedResponse: Login.FetchLastLoggedUser.Response!
        
        // MARK: Spied methods
        func presentLoginError(error: Error) {
        }
        
        func presentAccountDetails() {
            presentAccountDetailsCalled = true
        }
        
        func presentInvalidUser() {
            presentInvalidUserCalled = true
        }
        
        func presentInvalidPassword() {
            presentInvalidPasswordCalled = true
        }
        
        func presentLastLoggedUser(response: Login.FetchLastLoggedUser.Response) {
            lastLoggedResponse = response
            presentLastLoggedUserCalled = true
        }
    }
    
    class LoginWorkerSpy: LoginWorker {
        
        // MARK: Method call expectations
        var performLoginCalled = false
        
        // MARK: Spied methods
        override func performLogin(request: Login.Fetch.Request, completion: @escaping (LoginWorker.LoginResponse) -> Void) {
            performLoginCalled = true
            let response = Login.Fetch.Response(userId: 1, name: "Rafael", bankAccount: "123", agency: "23123", balance: 1250.90)
            completion(.success(response))
        }
    }
    
    // MARK: - Tests
    
    func testPerformLoginShouldAskLoginWorkerToFetchAndPresenterToFormatResults() {
        // Given
        let loginPresentationLogicSpy = LoginPresentationLogicSpy()
        sut.presenter = loginPresentationLogicSpy
        let loginWorkerSpy = LoginWorkerSpy()
        sut.worker = loginWorkerSpy
        
        // When
        sut.fetchLogin(Login.Fetch.Request(user: "rafa@gmail.com", password: "s$4T"))
        
        // Then
        XCTAssert(loginWorkerSpy.performLoginCalled, "PerformLogin should ask LoginWorker to perform login")
        XCTAssertTrue(loginPresentationLogicSpy.presentAccountDetailsCalled, "FetchLogin should ask presenter to format the result")
    }
    
    func testPerformLoginWithInvalidPasswordShouldAskPresenterToPresentError() {
        // Given
        let loginPresentationLogicSpy = LoginPresentationLogicSpy()
        sut.presenter = loginPresentationLogicSpy
        
        // When
        sut.fetchLogin(Login.Fetch.Request(user: "rafa@gmail.com", password: "aaa23"))
        
        // Then
        XCTAssertTrue(loginPresentationLogicSpy.presentInvalidPasswordCalled, "FetchLogin with invalid password should ask presenter to present error")
    }
    
    func testPerformLoginWithInvalidUserShouldAskPresenterToPresentError() {
        // Given
        let loginPresentationLogicSpy = LoginPresentationLogicSpy()
        sut.presenter = loginPresentationLogicSpy
        
        // When
        sut.fetchLogin(Login.Fetch.Request(user: "rafael", password: "aaa@s%5A23"))
        
        // Then
        XCTAssertTrue(loginPresentationLogicSpy.presentInvalidUserCalled, "FetchLogin with invalid password should ask presenter to present error")
    }
}
