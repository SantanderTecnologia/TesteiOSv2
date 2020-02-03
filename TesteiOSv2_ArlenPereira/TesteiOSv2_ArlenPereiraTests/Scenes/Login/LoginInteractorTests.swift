//
//  LoginInteractorTests.swift
//  TesteiOSv2_ArlenPereiraTests
//
//  Created by Arlen Ricardo Pereira on 28/01/20.
//  Copyright © 2020 Arlen Ricardo Pereira. All rights reserved.
//

@testable import TesteiOSv2_ArlenPereira
import XCTest

class LoginInteractorTests: XCTestCase {

    // MARK: - Subject under test
    var sut: LoginInteractor!
    
    override func setUp() {
        setupHomeIntereactor()
    }

    override func tearDown() { }
    
    // MARK: - Test setup
    func setupHomeIntereactor() {
        sut = LoginInteractor()

    }

    // MARK: - Test doubles
    class LoginPresentationLogicSpy: LoginPresentationLogic {
        
        // MARK: Method call expectations
        var responseLoginIsCalled = false
        var responseValidationLoginIsCalled = false
        
        func presentLogin(response: LoginModel.LoginRequestModel.Response) {
            responseLoginIsCalled = true
        }
        
        func presentValidationLogin(response: LoginModel.ValidationLoginModel.Response) {
            responseValidationLoginIsCalled = true
        }
    }
        

}
