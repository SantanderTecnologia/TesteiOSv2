//
//  LoginWorkerTest.swift
//  Williamberg BankTests
//
//  Created by padrao on 30/05/20.
//  Copyright © 2020 Williamberg. All rights reserved.
//
@testable import Williamberg_Bank
import UIKit
import XCTest
import Mockingjay


class LoginWorkerTest: XCTestCase {

    var sut: LoginWorker!
    
    override func setUp()
    {
      super.setUp()
        sut = LoginWorker()
    }
    
    func testUserErrorEnum(){
        XCTAssertEqual(LoginWorker.UserError.InvalidUser.localizedDescription, "Usuário inválido. Por favor, digite seu email ou cpf(somente números).")
        XCTAssertEqual(LoginWorker.UserError.EmptyUser.localizedDescription, "O usuário não pode ser vazio")
    }
    
    func testPasswordErrorEnum(){
        XCTAssertEqual(LoginWorker.PasswordError.NoCapitalLetter.localizedDescription, "A senha deve ter pelo menos uma uma letra maiúscula.")
        XCTAssertEqual(LoginWorker.PasswordError.NoEspecialCharacter.localizedDescription, "A senha deve ter pelo menos um caractere especial. Por exemplo: @ ou >.")
        XCTAssertEqual(LoginWorker.PasswordError.NoAlphanumericCharacter.localizedDescription, "A senha deve ter pelo menos um número ou letra minúscula.")
        XCTAssertEqual(LoginWorker.PasswordError.EmptyPassword.localizedDescription, "A senha não pode ser vazia")
    }
    
    func testValidadePassword(){
        XCTAssertThrowsError(try sut.validadePassword(password: "@"))
        XCTAssertThrowsError(try sut.validadePassword(password: "w1"))
        XCTAssertThrowsError(try sut.validadePassword(password: "Aq"))
        XCTAssertThrowsError(try sut.validadePassword(password: ""))
        XCTAssertThrowsError(try sut.validadePassword(password: "A@"))
        XCTAssertNoThrow(try sut.validadePassword(password: "A@a"))
    }
    
    func testValidadeUser(){
        XCTAssertThrowsError(try sut.validateUser(user: "qwe"))
        XCTAssertThrowsError(try sut.validateUser(user: ""))
        XCTAssertNoThrow(try sut.validateUser(user: "bergmpe@gmail.com"))
        XCTAssertNoThrow(try sut.validateUser(user: "28796874031"))
    }
    
    func testLoginSuccess(){
        let json = """
                    {
                        "userAccount": {
                            "userId": 1,
                            "name": "Jose da Silva Teste",
                            "bankAccount": "2050",
                            "agency": "012314564",
                            "balance": 3.3445
                        },
                        "error": {}
                    }
                """
        stub(uri(BaseBankAPI().baseUrl + "login"), jsonData( json.data(using: .utf8)!))
        let loginSuccess = XCTestExpectation(description: "login success expectation")
        sut.login(user: "berg@gmail.com", password: "A@1", completionHandler: {
            userAccount, errorMenssage in
            XCTAssertNotNil(userAccount)
            XCTAssertNil(errorMenssage)
            loginSuccess.fulfill()
        })
        wait(for: [loginSuccess], timeout: 10.0)
    }
    
    func testLoginFailUser(){
        let json = """
                    {
                        "userAccount": {},
                        "error": {
                            "code": 53,
                            "message": "Usuário ou senha incorreta"
                        }
                    }
                    """
        stub(uri(BaseBankAPI().baseUrl + "login"), jsonData( json.data(using: .utf8)!))
        let loginFail = XCTestExpectation(description: "login fail expectation")
        sut.login(user: "", password: "", completionHandler: {
            userAccount, errorMenssage in
            XCTAssertNil(userAccount)
            XCTAssertNotNil(errorMenssage)
            loginFail.fulfill()
        })
        wait(for: [loginFail], timeout: 10.0)
    }
    
    func testLoginWithResponseError(){
        let error = NSError(domain: BaseBankAPI().baseUrl + "login", code: 10, userInfo: nil)
        stub(uri(BaseBankAPI().baseUrl + "login"), failure(error))
        let loginFail = XCTestExpectation(description: "login fail with error expectation")
        sut.login(user: "berg@gmail.com", password: "@Q1a", completionHandler: {
            userAccount, errorMenssage in
            XCTAssertNil(userAccount)
            XCTAssertNotNil(errorMenssage)
            loginFail.fulfill()
        })
        wait(for: [loginFail], timeout: 10.0)
    }
    
    func testLoginWithNoData(){
        stub(uri(BaseBankAPI().baseUrl + "login"), {
            request in
              let response = HTTPURLResponse(url: request.url!, statusCode: 200, httpVersion: nil, headerFields: nil)!
            return .success(response, .noContent)
        })
        let loginFailNoData = XCTestExpectation(description: "login fail no data expectation")
        sut.login(user: "", password: "", completionHandler: {
            userAccount, errorMenssage in
            XCTAssertNil(userAccount)
            XCTAssertNotNil(errorMenssage)
            loginFailNoData.fulfill()
        })
        wait(for: [loginFailNoData], timeout: 10.0)
    }
    
    func testSaveUserOnKeychain(){
        let user = "51592148018"
        let saved = sut.saveUserOnKeychain(user: user, password: "A@1a")
        let userFromKeychain = sut.getUserOnKeychain()
        XCTAssertTrue(saved)
        XCTAssertEqual(userFromKeychain, user)
    }
}
