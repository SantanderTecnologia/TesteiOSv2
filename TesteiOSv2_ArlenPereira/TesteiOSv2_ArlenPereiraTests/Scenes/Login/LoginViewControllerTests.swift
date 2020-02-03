//
//  LoginViewControllerTests.swift
//  TesteiOSv2_ArlenPereiraTests
//
//  Created by Arlen Ricardo Pereira on 28/01/20.
//  Copyright © 2020 Arlen Ricardo Pereira. All rights reserved.
//

@testable import TesteiOSv2_ArlenPereira
import XCTest

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
    
    // MARK: - Test Setup
    func setupLoginViewController() {
        let bundle = Bundle.main
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        sut = storyboard.instantiateViewController(identifier: "LoginViewController") as? LoginViewController
        
        self.sut.loadView()
        self.sut.viewDidLoad()
    }
    
    func loadView() {
        window.addSubview(sut.view)
        RunLoop.current.run(until: Date())
    }

    // MARK: - Test doubles
    
    class LoginBusinessLoginSpy: LoginBusinessLogic {
        
        // MARK: Method call expectations
        var loginIsCalled = false
        var validationLoginIsCalled = false
        
        var requestLogin: LoginModel.LoginRequestModel.Request!
        var requestValidationLogin: LoginModel.ValidationLoginModel.Request!
        
        func loginRequest(request: LoginModel.LoginRequestModel.Request) {
            loginIsCalled = true
            self.requestLogin = request
        }
        
        func validationLoginRequest(request: LoginModel.ValidationLoginModel.Request) {
            validationLoginIsCalled = true
            self.requestValidationLogin = request
        }
    }
    
    // MARK: - Tests
    func testLoginViewController_ShouldNOT_beNull() {
        // Given
        
        // When
        
        // Then
        XCTAssertNotNil(sut)
    }
    
    // MARK: - Tests: Login
    func testViewDidLoad_shouldCall_loginRequest() {
        // Given
        let spy = LoginBusinessLoginSpy()
        sut.interactor = spy
        
        // When
        let request = LoginModel.LoginRequestModel.Request(username: "username", password: "password")
        sut.login(username: request.username, password: request.password)
        
        // Then
        XCTAssertTrue(spy.loginIsCalled)
    }
}
