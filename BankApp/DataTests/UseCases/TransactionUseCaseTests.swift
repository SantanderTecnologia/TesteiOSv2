//
//  TransactionUseCaseTests.swift
//  DataTests
//
//  Created by Estaife Lima on 07/06/20.
//  Copyright © 2020 Estaife Lima. All rights reserved.
//

import XCTest
import Domain
@testable import Data
import Networking
import Domain

class TransactionUseCaseTests: XCTestCase {
    
    func testTransactionShouldCallHttpClientWithUrlCorrect() {
        
        //Given
        let httpClientSpy = HTTPGetClientSpy()
        let sut = createSut(url: url, httpClientSpy: httpClientSpy)
        
        //When
        sut.getTransactions(identifier: identifier) { _ in }
        
        //Then
        XCTAssertEqual(httpClientSpy.url, [url.appendingPathComponent(identifier)])
        
    }
    
    func testGetTrasactionsSuccess() throws {
        
        // Given
        let httpClientSpy = HTTPGetClientSpy()
        let sut = createSut(url: url, httpClientSpy: httpClientSpy)
        let expectedResult: Result<TransactionResult, DomainError> = .success(transactionResultWithSuccess)
        
        // When
        let expect = expectation(description: "Waiting transactions")
        sut.getTransactions(identifier: identifier) { receivedResult in
            switch (expectedResult, receivedResult) {
            case (.failure(let expectedError), .failure(let receivedError)):
                XCTAssertEqual(expectedError, receivedError)
            case (.success(let expectedModel), .success(let receivedModel)):
                XCTAssertEqual(expectedModel.statementList, receivedModel.statementList)
                XCTAssertEqual(expectedModel.error, receivedModel.error)
            default: XCTFail("Fail, because expected and received not equal")
            }
            expect.fulfill()
        }
        httpClientSpy.completeWith(data: transactionResultWithSuccess.data!)
        
        //Then
        wait(for: [expect], timeout: 1)
    }
    
    func testGetTrasactionsSuccessFailure() throws {
        // Given
        let httpClientSpy = HTTPGetClientSpy()
        let sut = createSut(url: UseCasesEndpoint.transactions.url!, httpClientSpy: httpClientSpy)
        let expectedResult: Result<TransactionResult, DomainError> = .success(transactionResultWithError)
        
        // When
        let expect = expectation(description: "Waiting transactions")
        sut.getTransactions(identifier: identifier) { receivedResult in
            switch (expectedResult, receivedResult) {
            case (.failure(let expectedError), .failure(let receivedError)):
                XCTAssertEqual(expectedError, receivedError)
            case (.success(let expectedModel), .success(let receivedModel)):
                XCTAssertEqual(expectedModel.statementList, receivedModel.statementList)
                XCTAssertEqual(expectedModel.error, receivedModel.error)
            default: XCTFail("Fail, because expected and received not equal")
            }
            expect.fulfill()
        }
        httpClientSpy.completeWith(data: transactionResultWithError.data!)
        
        //Then
        wait(for: [expect], timeout: 1)
        
    }
}

extension TransactionUseCaseTests {
    
    func createSut(url: URL, httpClientSpy: HTTPGetClient, file: StaticString = #file, line: UInt = #line) -> TransactionsUseCase {
        let sut = TransactionsUseCase(url: url, httpClient: httpClientSpy)
        memoryLeakCheckWith(instance: sut)
        return sut
    }
    
    var identifier: String {
        return "any_identifier"
    }
    
    var transactionResultWithSuccess: TransactionResult {
        return .init(statementList: [StatementList(title: "any_title", desc: "any_desc", date: "any_date", value: 0.0)], error: AuthError())
    }

    var transactionResultWithError: TransactionResult {
        return .init(statementList: [], error: .init(code: 53, message: "Usuário não encontrado"))
    }
}
