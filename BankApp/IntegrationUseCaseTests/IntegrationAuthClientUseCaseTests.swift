//
//  IntegrationAuthClientUseCaseTests.swift
//  IntegrationUseCaseTests
//
//  Created by Estaife Lima on 03/06/20.
//  Copyright © 2020 Estaife Lima. All rights reserved.
//

import XCTest
import Data
import Networking
import Domain

class IntegrationAuthClientUseCaseTests: XCTestCase {
    
    func testAuthenticationUserSuccess() throws {

        // Given
        let sut = createSut()
        let authClientModel = AuthClientModel(user: "test_user", password: "Test@1")

        // When
        let userAccont = UserAccountInternalResponse(userID: 1, name: "Jose da Silva Teste", bankAccount: "2050", agency: "012314564", balance: 3.3445)

        // Then
        let expect = expectation(description: "Waiting auth user")
        sut.login(authenticationModel: authClientModel) { result in
            switch result {
            case.success(let user):
                XCTAssertEqual(user.userAccount.agency, userAccont.agency)
                XCTAssertEqual(user.userAccount.balance, userAccont.balance)
                XCTAssertEqual(user.userAccount.bankAccount, userAccont.bankAccount)
                XCTAssertEqual(user.userAccount.name, userAccont.name)
                XCTAssertEqual(user.userAccount.userID, userAccont.userID)
            case .failure(let error):
                XCTFail("Expected an user account, received this \(error) instead")
            }
            expect.fulfill()
        }
        wait(for: [expect], timeout: 3)
    }
    
    func testAuthenticationUserFailurePassword() throws {
    
        // Given
        let sut = createSut()
        let authClientModel = AuthClientModel(user: "", password: "")

        // When
        let authError = AuthError(code: 53, message: "Usuário ou senha incorreta")

        // Then
        let expect = expectation(description: "Waiting auth user")
        sut.login(authenticationModel: authClientModel) { result in
            switch result {
            case.success(let user):
                XCTAssertEqual(user.authError.code, authError.code)
                XCTAssertEqual(user.authError.message, authError.message)
            case .failure(let error):
                XCTFail("Expected an user error, received this \(error) instead")
            }
            expect.fulfill()
        }
        wait(for: [expect], timeout: 1)
    }
    
    func testAuthenticationFailure() throws {
    
        // Given
        let sut = createSut(url: URL(string: "https://any-url.com")!)
        let authClientModel = AuthClientModel(user: "", password: "")

        // When/Then
        let expect = expectation(description: "Waiting auth user")
        sut.login(authenticationModel: authClientModel) { result in
            switch result {
            case.success(let user):
                XCTFail("Expected an user error, received this \(user) instead")
            case .failure(let error):
                XCTAssertNotNil(error)
            }
            expect.fulfill()
        }
        wait(for: [expect], timeout: 1)
    }
}

extension IntegrationAuthClientUseCaseTests {
    func createSut(url: URL = URL(string: "https://bank-app-test.herokuapp.com/api/login")!, file: StaticString = #file, line: UInt = #line) -> AuthClientUseCase {
        let httpPostClient = AlamofireAdapter()
        let sut = AuthClientUseCase(url: url, httpClient: httpPostClient)
        memoryLeakCheckWith(instance: sut)
        return sut
    }
}
