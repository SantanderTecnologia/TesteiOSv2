//
//  LoginViewControllerTests.swift
//  BankInterviewAppTests
//
//  Created by Osias Carneiro on 11/03/20.
//  Copyright © 2020 Osias Carneiro. All rights reserved.
//

import XCTest

class LoginViewControllerTests: XCTestCase {
    
    var controller: LoginViewController!
    
    override func setUp() {
        let bundle = Bundle(for: type(of: self))
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        let loginViewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        _ = loginViewController.loadViewIfNeeded()
        self.controller = loginViewController
    }
    
    func testSetup() {
        XCTAssert(controller.interactor != nil && controller.router != nil)
    }
    
    func testRouteToStatements() {
        controller.loginSucess(user: Login.ViewModel(id: 1, name: "asdasd", agency: "1000", account: "1315684681", balance: 36.65))
        
        //TODO: testar navegacao?
    }
    
    func testErrorTextInField() {
        controller.loginError(error: Login.Error(message: "Error message"))
        
        XCTAssert(controller.error.text == "Error message")
    }
    
    func testChangeInTextFieldWithCpfMask() {
        controller.user.insertText("01234567890")
        
        XCTAssert(controller.user.text == "012.345.678-90")
    }
    
    func testChangeInTextFieldWithBlankText() {
        controller.user.insertText("")
        
        XCTAssert(controller.user.text == "")
    }
    
    func testLoginButton() {
        controller.login()
        
        XCTAssert(controller.error.text == "Invalid user/password")
    }
    
}
