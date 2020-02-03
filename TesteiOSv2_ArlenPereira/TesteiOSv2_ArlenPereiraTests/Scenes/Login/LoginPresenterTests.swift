//
//  LoginPresenterTests.swift
//  TesteiOSv2_ArlenPereiraTests
//
//  Created by Arlen Ricardo Pereira on 28/01/20.
//  Copyright © 2020 Arlen Ricardo Pereira. All rights reserved.
//

@testable import TesteiOSv2_ArlenPereira
import XCTest
import SwiftyJSON

class LoginPresenterTests: XCTestCase {
    
    // MARK: - Subject under test
    var sut: LoginPresenter!
    
    override func setUp() {
        setupLoginPresenter()
    }

    override func tearDown() { }
    
    // MARK: - Test setup
    func setupLoginPresenter() {
        sut = LoginPresenter()
    }
    
    func loginUserAccountMock() -> [LoginAPIRequest]? {

        let loginUserAccount0 = LoginAPIRequest(json: JSON(dictionaryLiteral: ("userId",1), ("name","Jose da Silva Teste"), ("bankAccount","2050"), ("agency","01234564"), ("balance",3.3445), ("code", 0), ("message", "")))

        return [loginUserAccount0]
    }

    func loginErrorMock() -> [LoginAPIRequest]? {

        let loginUserAccount1 = LoginAPIRequest(json: JSON(dictionaryLiteral: ("userId",0), ("name",""), ("bankAccount",""), ("agency",""), ("balance",0.0), ("code", 53), ("message", "Usuário ou senha incorreta")))

        return [loginUserAccount1]
    }
    
    class LoginDisplayLogicSpy: LoginDisplayLogic {
        
        // MARK: Method call expectations
        // Login
        var displayLoginIsCalled_userId = false
        var displayLoginIsCalled_name = false
        var displayLoginIsCalled_bankAccount = false
        var displayLoginIsCalled_agency = false
        var displayLoginIsCalled_balance = false
        var displayLoginIsCalled_code = false
        var displayLoginIsCalled_message = false
        
        // Validation Login
        var displayValidationLoginIsCalled_isUsernameValid = false
        var displayValidationLoginIsCalled_isPasswordValid = false
        var displayValidationLoginIsCalled_errorMessage = false
        
        var viewLogin: LoginModel.LoginRequestModel.ViewModel!
        var viewValidationLogin: LoginModel.ValidationLoginModel.ViewModel!
        
        // Function
        func displayLogin(viewModel: LoginModel.LoginRequestModel.ViewModel) {
            viewLogin = viewModel
            for item in viewModel.data {
                if item.userId != nil {
                    displayLoginIsCalled_userId = true
                }
                
                if item.name != nil {
                    displayLoginIsCalled_name = true
                }
                
                if item.bankAccount != nil {
                    displayLoginIsCalled_bankAccount = true
                }
                
                if item.agency != nil {
                    displayLoginIsCalled_agency = true
                }
                
                if item.balance != nil {
                    displayLoginIsCalled_balance = true
                }
                
                if item.code != nil {
                    displayLoginIsCalled_code = true
                }
                
                if item.message != nil {
                    displayLoginIsCalled_message = true
                }
            }
        }
        
        func displayValidationLogin(viewModel: LoginModel.ValidationLoginModel.ViewModel) {
            viewValidationLogin = viewModel
            
            if !viewValidationLogin.isUsernameValid {
                displayValidationLoginIsCalled_isUsernameValid = true
            }
            
            if !viewValidationLogin.isPasswordValid {
                displayValidationLoginIsCalled_isPasswordValid = true
            }
            
            if !viewValidationLogin.errorMessage.isEmpty {
                displayValidationLoginIsCalled_errorMessage = true
            }
        }
    }

    // MARK: Tests
    func testPresentLogin_with_validInput_shouldCall_isValid_displayLoginData() {
        // Given
        let spy = LoginDisplayLogicSpy()
        sut.viewController = spy
        let loginAPIResponse = LoginAPIModel(data: loginUserAccountMock(), message: "nil", code: "nil")
        let response = LoginModel.LoginRequestModel.Response(loginResponse: loginAPIResponse)
        
        // When
        sut.presentLogin(response: response)
        
        // Then
        XCTAssertTrue(spy.displayLoginIsCalled_userId, "When the valid input is passed to presenter \nThen userId from displayLoginData should be called")
    }
    
    func testPresentLogin_validation_username_isValidEmail() {
        // Given
        let username = "text@gmail.com"
        
        // When
        let result = sut.validateEmail(username: username)
        
        // Then
        XCTAssertTrue(result)
    }
    
    func testPresentLogin_validation_username_isNOTValidEmail() {
        // Given
        let username = "11122233374"
        
        // When
        let result = sut.validateEmail(username: username)
        
        // Then
        XCTAssertFalse(result)
    }
    
    func testPresentLogin_validation_username_with_format_CPF_isValidCFP() {
        // Given
        let username = "957.621.155-77" // Format CPF = 957.621.155-77
        
        // When
        let result = sut.validateCPF(username: username)
        
        // Then
        XCTAssertTrue(result)
    }
    
    func testPresentLogin_validation_username_without_format_CPF_isValidCFP() {
        // Given
        let username = "95762115577" // Format CPF = 957.621.155-77
        
        // When
        let result = sut.validateCPF(username: username)
        
        // Then
        XCTAssertTrue(result)
    }
    
    func testPresentLogin_validation_username_without_format_CPF_isNOTValidCFP() {
        // Given
        let username = "11111111111" // Format CPF = 111.111.111-11
        
        // When
        let result = sut.validateCPF(username: username)
        
        // Then
        XCTAssertFalse(result)
    }
    
    func testPresentLogin_validation_username_with_format_CPF_isNOTValidCFP() {
        // Given
        let username = "111.111.111-11" // Format CPF = 111.111.111-11
        
        // When
        let result = sut.validateCPF(username: username)
        
        // Then
        XCTAssertFalse(result)
    }
    
    func testPresentLogin_validation_password_with_one_uppercase_with_one_alphanumeric_and_with_one_special_character_isValidPassword() {
        // Given
        let password = "Test9#" // "T" = uppercase, "1" = alphanumeric, "#" = special character
        
        // When
        let result = sut.validatePassword(password: password)
        
        // Then
        XCTAssertTrue(result)
    }
    
    func testPresentLogin_validation_password_withOUT_uppercase_with_one_alphanumeric_and_with_one_special_character_isNOTValidPassword() {
        // Given
        let password = "test9#" // "1" = alphanumeric, "#" = special character
        
        // When
        let result = sut.validatePassword(password: password)
        
        // Then
        XCTAssertFalse(result)
    }
    
    func testPresentLogin_validation_password_with_one_uppercase_withOUT_alphanumeric_and_with_one_special_character_isNOTValidPassword() {
        // Given
        let password = "Test#" // "T" = uppercase, "#" = special character
        
        // When
        let result = sut.validatePassword(password: password)
        
        // Then
        XCTAssertFalse(result)
    }
    
    func testPresentLogin_validation_password_with_one_uppercase_with_one_alphanumeric_and_withOUT_special_character_isNOTValidPassword() {
        // Given
        let password = "Test9" // "T" = uppercase, "1" = alphanumeric
        
        // When
        let result = sut.validatePassword(password: password)
        
        // Then
        XCTAssertFalse(result)
    }
}
