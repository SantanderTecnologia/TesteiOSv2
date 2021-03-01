//
//  LoginInteractorTests.swift
//  BankApp-DesafioTests
//
//  Created by Mizia Lima on 2/28/21.
//

import XCTest
@testable import BankApp_Desafio

class LoginInteractorTests: XCTestCase {
    var sut: LoginInteractor!
    var presenterMock: LoginPresenterMock!
    var workerMock: LoginWorkerMock!
    
    override func setUp() {
        self.workerMock = LoginWorkerMock()
        self.sut = LoginInteractor(worker: workerMock)
        self.presenterMock = LoginPresenterMock()
        self.sut.presenter = presenterMock
    }
    
    func test_login_when_username_is_nil_and_password_is_not_nil_should_send_error_message_to_presenter() {
        let expectedMessage = "Campos de usuário ou senha não preenchidos."
        let username: String? = nil
        let password: String? = "senha123"
        
        sut.login(username: username, password: password)
        
        XCTAssertEqual(expectedMessage, presenterMock.receivedMessage)
    }
    
    func test_login_when_username_is_not_nil_and_password_is_nil_should_send_error_message_to_presenter() {
        let expectedMessage = "Campos de usuário ou senha não preenchidos."
        let username: String? = "mizia.almeida@gmail.com"
        let password: String? = nil
        
        sut.login(username: username, password: password)
        
        XCTAssertEqual(expectedMessage, presenterMock.receivedMessage)
    }
    
    func test_login_when_username_and_password_are_nil_should_send_error_message_to_presenter() {
        let expectedMessage = "Campos de usuário ou senha não preenchidos."
        let username: String? = nil
        let password: String? = nil
        
        sut.login(username: username, password: password)
        
        XCTAssertEqual(expectedMessage, presenterMock.receivedMessage)
    }
    
    func test_login_when_username_and_password_are_not_nil_should_send_a_diferent_error_message_to_presenter() {
        let expectedMessage = "Campos de usuário ou senha não preenchidos."
        let username: String? = "mizia.alima"
        let password: String? = "senha123"
        
        sut.login(username: username, password: password)
        
        XCTAssertNotEqual(expectedMessage, presenterMock.receivedMessage)
    }
    
    func test_login_when_username_is_invalid_and_password_is_valid_should_send_a_error_message_to_presenter() {
        let expectedMessage = "Preencha seu usuário com E-mail ou CPF."
        let username: String? = "mizia.alima"
        let password: String? = "Senha123@"
        
        sut.login(username: username, password: password)
        
        XCTAssertEqual(expectedMessage, presenterMock.receivedMessage)
    }
    
    func test_login_when_username_is_valid_cpf_and_password_is_invalid_should_send_a_diferent_error_message_to_presenter() {
        let expectedMessage = "Preencha seu usuário com E-mail ou CPF."
        let username: String? = "04060919357"
        let password: String? = "senha123"
        
        sut.login(username: username, password: password)
        
        XCTAssertNotEqual(expectedMessage, presenterMock.receivedMessage)
    }
    
    func test_login_when_username_is_valid_email_and_password_is_invalid_should_send_a_diferent_error_message_to_presenter() {
        let expectedMessage = "Preencha seu usuário com E-mail ou CPF."
        let username: String? = "mizia.alima@gmail.com"
        let password: String? = "senha123"
        
        sut.login(username: username, password: password)
        
        XCTAssertNotEqual(expectedMessage, presenterMock.receivedMessage)
    }
    
    func test_login_when_username_is_valid_and_password_is_invalid_should_send_a_error_message_to_presenter() {
        let expectedMessage = "Sua senha deve conter pelo menos 1 caractere alfanumérico, 1 caractere especial e 1 letra maiúscula."
        let username: String? = "mizia.alima@gmail.com"
        let password: String? = "senha123"
        
        sut.login(username: username, password: password)
        
        XCTAssertEqual(expectedMessage, presenterMock.receivedMessage)
    }
    
    func test_login_when_username_is_valid_and_password_is_valid_should_call_worker() {
        let userError = "Preencha seu usuário com E-mail ou CPF."
        let passwordError = "Sua senha deve conter pelo menos 1 caractere alfanumérico, 1 caractere especial e 1 letra maiúscula."
        let username: String? = "mizia.alima@gmail.com"
        let password: String? = "Senha123@"
        let expectedUser = LoginResponseMock.createResponse().user
        
        sut.login(username: username, password: password)
        
        XCTAssertNotEqual(userError, presenterMock.receivedMessage)
        XCTAssertNotEqual(passwordError, presenterMock.receivedMessage)
        XCTAssertTrue(workerMock.loginWasCalled)
        XCTAssertEqual(expectedUser.userAccount.userID, presenterMock.receivedResponse?.user.userAccount.userID)
        XCTAssertEqual(expectedUser.userAccount.name, presenterMock.receivedResponse?.user.userAccount.name)
        XCTAssertEqual(expectedUser.userAccount.bankAccount, presenterMock.receivedResponse?.user.userAccount.bankAccount)
        XCTAssertEqual(expectedUser.userAccount.agency, presenterMock.receivedResponse?.user.userAccount.agency)
        XCTAssertEqual(expectedUser.userAccount.balance, presenterMock.receivedResponse?.user.userAccount.balance)
    }
    
    func test_login_when_username_is_valid_and_password_is_valid_and_ocurred_a_error_with_worker() {
        let userError = "Preencha seu usuário com E-mail ou CPF."
        let passwordError = "Sua senha deve conter pelo menos 1 caractere alfanumérico, 1 caractere especial e 1 letra maiúscula."
        let username: String? = "mizia.alima@gmail.com"
        let password: String? = "Senha123@"
        let expectedUser = LoginResponseMock.createResponse().user
        
        sut.login(username: username, password: password)
        XCTAssertNotEqual(userError, presenterMock.receivedMessage)
        XCTAssertNotEqual(passwordError, presenterMock.receivedMessage)
        XCTAssertTrue(workerMock.isFailledCase)
    }
}
