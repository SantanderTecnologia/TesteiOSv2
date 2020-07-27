//
//  LoginViewControllerTests.swift
//  TesteIOSTests
//
//  Created by VM on 26/07/20.
//  Copyright © 2020 VM. All rights reserved.
//

@testable import TesteIOS
import XCTest

class LoginViewControllerTests: XCTestCase {
    
    var sut : LoginViewController!
    var window: UIWindow!
    
    override func setUp() {
        super.setUp()
        window = UIWindow()
        setupLoginViewController()
    }

    func setupLoginViewController() {
        let bundle = Bundle.main
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        sut = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController
    }
    
    func loadView() {
        window.addSubview(sut.view)
        RunLoop.current.run(until: Date())
    }
    
    class LoginBusinessLogicSpy: LoginBusinessLogic {
        var performLoginIsCalled = false
        var getLastUsernameIsCalled = false
        
        func performLogin(request: LoginModel.Login.Request) {
            performLoginIsCalled = true
        }
        
        func getLastUserName() {
            getLastUsernameIsCalled = true
        }
    }
    
    func testperformLogin() {
        let spy = LoginBusinessLogicSpy()
        sut.interactor = spy
        
        loadView()
        sut.performLogin()
        
        XCTAssertTrue(spy.performLoginIsCalled)
    }
    
    func testGetLastUsername() {
        let spy = LoginBusinessLogicSpy()
        sut.interactor = spy
        
        loadView()
        sut.getLastUsername()
        
        XCTAssertTrue(spy.getLastUsernameIsCalled)
    }

    func testFillUsername() {
        loadView()
        sut.fillLastUsername(username: "teste@teste.com")
        
        XCTAssertEqual(sut.userTextField.text, "teste@teste.com")
    }
    
}
