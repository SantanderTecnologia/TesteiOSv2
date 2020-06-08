//
//  AuthClientUseCaseTests.swift
//  DataTests
//
//  Created by Estaife Lima on 30/05/20.
//  Copyright © 2020 Estaife Lima. All rights reserved.
//

import XCTest
import Domain
@testable import Data

class AuthClientUseCaseTests: XCTestCase {
    
    func testLoginShouldCallHttpClientWithUrlCorrect() {
        
        //Given
        let (sut, httpClientSpy) = makeSut(with: url)

        //When
        sut.login(authenticationModel: authClientModel) { _ in }
        
        //Then
        XCTAssertEqual(httpClientSpy.url, [url])
        
    }
    
    func testLoginShouldCallHttpClientWithDataCorrect() {
        
        //Given
        let (sut, httpClientSpy) = makeSut()

        //When
        sut.login(authenticationModel: authClientModel) { _ in }
        
        //Then
        XCTAssertEqual(httpClientSpy.data, authClientModel.data)
    }
    
    func testLoginShouldCompleteWithErrorWhenUserFails() {
        
        //Given
        let (sut, httpClientSpy) = makeSut()

        //When/Then
        expect(sut, completeWith: .failure(.unknown), whem: {
            httpClientSpy.completeWith(error: .noConnectivity)
        })
    }
    
    func testLoginShouldCompleteWithAcountWhenUserGiveSuccesWithValidData() {
        
        //Given
        let (sut, httpClientSpy) = makeSut()
        
        //When/Then
        expect(sut, completeWith: .success(userAccountResponse), whem: {
            httpClientSpy.completeWith(data: userAccountResponse.data!)
        })
    }
    
    func testLoginShouldCompleteWithAcountWhenUserGiveSuccesWithInvalidData() {
        
        //Given
        let (sut, httpClientSpy) = makeSut()
        
        //When/Then
        expect(sut, completeWith: .failure(.convert), whem: {
            httpClientSpy.completeWith(data: dataInvalid)
        })
    }
    
    func testLoginShouldDontcompleteAndDeinitializer() {
        
        //Given
        let httpClientSpy = HTTPPostClientSpy()
        var sut: AuthClientUseCase? = .init(url: url, httpClient: httpClientSpy)
        var result: Result<UserAccountResponse, DomainError>?
        
        //When
        sut?.login(authenticationModel: authClientModel, completion: { result = $0 })
        sut = nil
        httpClientSpy.completeWith(data: dataInvalid)
        
        //Then
        XCTAssertNil(result)
    }
}

extension AuthClientUseCaseTests {
    
    var authClientModel: AuthClientModel {
        return .init(user: "email_any", password: "email_password")
    }
    
    func makeSut(with url: URL = URL(string: "http://url-mock.com")!, file: StaticString = #file, line: UInt = #line) -> (sut: AuthClientUseCase, httpClientSpy: HTTPPostClientSpy) {
        let httpClientSpy = HTTPPostClientSpy()
        let sut = AuthClientUseCase(url: url, httpClient: httpClientSpy)
        memoryLeakCheckWith(instance: sut, file: file, line: line)
        memoryLeakCheckWith(instance: httpClientSpy, file: file, line: line)
        return (sut, httpClientSpy)
    }
    
    func expect(_ sut: AuthClientUseCase, completeWith expectedResult: Result<UserAccountResponse, DomainError>, whem action: () -> Void, file: StaticString = #file, line: UInt = #line) {
        let expectetion = expectation(description: "waiting")
        sut.login(authenticationModel: authClientModel) { receivedResult in
            switch (expectedResult, receivedResult) {
            case (.failure(let expectedError), .failure(let receivedError)): XCTAssertEqual(expectedError, receivedError, file: file, line: line)
            case (.success(let expectedModel), .success(let receivedModel)): XCTAssertEqual(expectedModel, receivedModel, file: file, line: line)
            default: XCTFail("Fail, because expected and received not equal", file: file, line: line)
            }
            expectetion.fulfill()
        }
        action()
        wait(for: [expectetion], timeout: 1)
    }
}
