//
//  PasswordValidationTests.swift
//  BankAppTests
//
//  Created by Bruno Maciel on 1/16/21.
//

import XCTest
@testable import BankApp

class PasswordValidationTests: XCTestCase {

    let interactor = LoginInteractor()
    let failValidationMessage = """
        Senha deve conter:
        ao menos um número, uma letra maiúscula e um caracter especial -@#$%^&*.
        """

    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    // MARK: - Validation MUST FAIL
    
    func test_validatePassword_nilUsername() {
        let nilPassword: String? = nil
        
        XCTAssertThrowsError(try interactor.validatePassword(nilPassword)) { error in
            XCTAssertEqual(error as! LoginInteractor.LoginError, LoginInteractor.LoginError.blankPassword)
        }
    }
    
    func test_validatePassword_emptyUsername() {
        let emptyPassword: String? = ""
        
        XCTAssertThrowsError(try interactor.validatePassword(emptyPassword)) { error in
            XCTAssertEqual(error as! LoginInteractor.LoginError, LoginInteractor.LoginError.blankPassword)
        }
    }
    
    func test_validatePassword_onlyNumbersPassword() {
        let onlyNumbersPassword = "12345678"
        
        XCTAssertThrowsError(try interactor.validatePassword(onlyNumbersPassword)) { error in
            XCTAssertEqual(error as! LoginInteractor.LoginError, LoginInteractor.LoginError.invalidPassword(message: failValidationMessage))
        }
    }
    
    func test_validatePassword_onlyUppercasedPassword() {
        let onlyUppercasedPassword = "QWERASDF"
        
        XCTAssertThrowsError(try interactor.validatePassword(onlyUppercasedPassword)) { error in
            XCTAssertEqual(error as! LoginInteractor.LoginError, LoginInteractor.LoginError.invalidPassword(message: failValidationMessage))
        }
    }
    
    func test_validatePassword_onlyLowercasedPassword() {
        let onlyLowercasedPassword = "qweradsf"
        
        XCTAssertThrowsError(try interactor.validatePassword(onlyLowercasedPassword)) { error in
            XCTAssertEqual(error as! LoginInteractor.LoginError, LoginInteractor.LoginError.invalidPassword(message: failValidationMessage))
        }
    }
    
    func test_validatePassword_onlySpecialCharacters() {
        let onlySpecialCharacters = "@#$%^&*@"
        
        XCTAssertThrowsError(try interactor.validatePassword(onlySpecialCharacters)) { error in
            XCTAssertEqual(error as! LoginInteractor.LoginError, LoginInteractor.LoginError.invalidPassword(message: failValidationMessage))
        }
    }
    
    func test_validatePassword_onlyNumbersAndUppercasedPassword() {
        let onlyNumbersAndUppercasedPassword = "1234QWER"
        
        XCTAssertThrowsError(try interactor.validatePassword(onlyNumbersAndUppercasedPassword)) { error in
            XCTAssertEqual(error as! LoginInteractor.LoginError, LoginInteractor.LoginError.invalidPassword(message: failValidationMessage))
        }
    }
    
    func test_validatePassword_onlyNumbersAndSpecialCharPassword() {
        let onlyNumbersAndSpecialCharPassword = "1234%^&*@"
        
        XCTAssertThrowsError(try interactor.validatePassword(onlyNumbersAndSpecialCharPassword)) { error in
            XCTAssertEqual(error as! LoginInteractor.LoginError, LoginInteractor.LoginError.invalidPassword(message: failValidationMessage))
        }
    }
    
    func test_validatePassword_onlyUppercasedAndSpecialCharPassword() {
        let onlyUppercasedAndSpecialCharPassword = "QWER%^&*@"
        
        XCTAssertThrowsError(try interactor.validatePassword(onlyUppercasedAndSpecialCharPassword)) { error in
            XCTAssertEqual(error as! LoginInteractor.LoginError, LoginInteractor.LoginError.invalidPassword(message: failValidationMessage))
        }
    }
    
    
    // MARK: - Validation MUST SUCCEED
    
    func test_validatePassword_oneUppercased_OneNumber_OneSpecialChar() {
        let oneUppercased_OneNumber_OneSpecialChar = "1321QWE--"
        let oneUppercased_OneNumber_OneSpecialChar2 = "1Q-"
        
        XCTAssertNoThrow(try interactor.validatePassword(oneUppercased_OneNumber_OneSpecialChar))
        XCTAssertNoThrow(try interactor.validatePassword(oneUppercased_OneNumber_OneSpecialChar2))
    }

}
