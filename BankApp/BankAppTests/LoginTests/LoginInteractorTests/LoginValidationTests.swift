//
//  LoginValidationTests.swift
//  BankAppTests
//
//  Created by Bruno Maciel on 1/16/21.
//

import XCTest
@testable import BankApp

class LoginValidationTests: XCTestCase {
    
    let interactor = LoginInteractor()
    let blankUsername: String? = ""
    let blankPassword: String? = ""
    let invalidUsername: String? = "qwert"
    let invalidPassword: String? = "qwert"
    let validUsername: String? = " email@email.com"
    let validPassword: String? = "123QWER-$"
    let invalidPasswordMessage = """
        Senha deve conter:
        ao menos um número, uma letra maiúscula e um caracter especial -@#$%^&*.
        """

    struct LoginFormMock: LoginFormProtocol {
        var userMock: String?
        var passwordMock: String?
        
        var password: String? { return passwordMock }
        var username: String? { return userMock }
    }
    
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    // MARK: - Validation MUST FAIL
    
    func test_validateUsername_blankUsername() {
        let blankUsernameForm = LoginFormMock(userMock: blankUsername, passwordMock: validPassword)
        
        interactor.validateLogin(blankUsernameForm) { _ in
            XCTAssertFalse(true)
        } fail: { errorMessage in
            XCTAssertTrue(true)
            XCTAssertEqual(errorMessage, "Username não informado")
        }
    }
    
    func test_validateUsername_invalidUsername() {
        let invalidUsernameForm = LoginFormMock(userMock: invalidUsername, passwordMock: validPassword)
        
        interactor.validateLogin(invalidUsernameForm) { _ in
            XCTAssertFalse(true)
        } fail: { errorMessage in
            XCTAssertTrue(true)
            XCTAssertEqual(errorMessage, "Username inválido.\nUsername deve ser um e-mail ou número de cpf")
        }
    }
    
    func test_validateUsername_blankPasssword() {
        let blankPasswordForm = LoginFormMock(userMock: validUsername, passwordMock: blankPassword)
        
        interactor.validateLogin(blankPasswordForm) { _ in
            XCTAssertFalse(true)
        } fail: { errorMessage in
            XCTAssertTrue(true)
            XCTAssertEqual(errorMessage, "Senha não informada")
        }
    }
    
    func test_validateUsername_invalidPasssword() {
        let invalidPassswordForm = LoginFormMock(userMock: validUsername, passwordMock: invalidPassword)
        
        interactor.validateLogin(invalidPassswordForm) { _ in
            XCTAssertFalse(true)
        } fail: { errorMessage in
            XCTAssertTrue(true)
            XCTAssertEqual(errorMessage, invalidPasswordMessage)
        }
    }
    
    
    // MARK: - Validation MUST SUCCEED
    
    func test_validateUsername_validLogin() {
        let validLoginForm = LoginFormMock(userMock: validUsername, passwordMock: validPassword)
        
        interactor.validateLogin(validLoginForm) { loginForm in
            XCTAssertTrue(true)
            XCTAssert(loginForm.username == validLoginForm.username!.trimmingCharacters(in: .whitespaces))
            XCTAssert(loginForm.password == validLoginForm.password!)
        } fail: { _ in
            XCTAssertFalse(true)
        }
    }

}

