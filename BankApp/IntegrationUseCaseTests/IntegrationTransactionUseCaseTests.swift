//
//  IntegrationTransactionUseCaseTests.swift
//  IntegrationUseCaseTests
//
//  Created by Estaife Lima on 07/06/20.
//  Copyright © 2020 Estaife Lima. All rights reserved.
//

import XCTest
import Data
import Networking
import Domain

class IntegrationTransactionUseCaseTests: XCTestCase {
    
    func testTrasactionsSuccess() throws {
        
        // Given
        let sut = createSut(url: UseCasesEndpoint.transactions.url!)
        let statementList = transactionResultWithSuccess.statementList
        
        // When/Then
        let expect = expectation(description: "Waiting transactions")
        sut.getTransactions(identifier: identifierWithSuccess) { result in
            switch result {
            case .success(let result):
                XCTAssertEqual(result.statementList, statementList)
            case .failure(let error):
                 XCTFail("Expected an statement list, received this \(error) instead")
            }
            expect.fulfill()
        }
        
        wait(for: [expect], timeout: 1)
    }
    
    func testTrasactionsSuccessFailure() throws {
        
        // Given
        let sut = createSut(url: UseCasesEndpoint.transactions.url!)
        let error = transactionResultWithError.error
        
        // When/Then
        let expect = expectation(description: "Waiting transactions")
        sut.getTransactions(identifier: identifierWithFailure) { result in
            switch result {
            case .success(let result):
                XCTAssertTrue(result.statementList.isEmpty)
                XCTAssertEqual(result.error, error)
            case .failure(let error):
                XCTFail("Expected an error into case .success, received this \(error) instead")
            }
            expect.fulfill()
        }
        wait(for: [expect], timeout: 1)
    }
}

extension IntegrationTransactionUseCaseTests {
    
    func createSut(url: URL, file: StaticString = #file, line: UInt = #line) -> TransactionsUseCase {
        let httpGetClient = AlamofireAdapter()
        let sut = TransactionsUseCase(url: url, httpClient: httpGetClient)
        memoryLeakCheckWith(instance: sut)
        return sut
    }
    
    var identifierWithSuccess: String {
        return "1"
    }
    
    var transactionResultWithSuccess: TransactionResult {
        let data = """
                    {
                      "statementList": [
                        {
                          "title": "Pagamento",
                          "desc": "Conta de luz",
                          "date": "2018-08-15",
                          "value": -50
                        },
                        {
                          "title": "TED Recebida",
                          "desc": "Joao Alfredo",
                          "date": "2018-07-25",
                          "value": 745.03
                        },
                        {
                          "title": "DOC Recebida",
                          "desc": "Victor Silva",
                          "date": "2018-06-23",
                          "value": 399.9
                        },
                        {
                          "title": "Pagamento",
                          "desc": "Conta de internet",
                          "date": "2018-05-12",
                          "value": -73.4
                        },
                        {
                          "title": "Pagamento",
                          "desc": "Faculdade",
                          "date": "2018-09-10",
                          "value": -500
                        },
                        {
                          "title": "Pagamento",
                          "desc": "Conta de telefone",
                          "date": "2018-10-17",
                          "value": -760
                        },
                        {
                          "title": "TED Enviada",
                          "desc": "Roberto da Luz",
                          "date": "2018-07-27",
                          "value": -35.67
                        },
                        {
                          "title": "Pagamento",
                          "desc": "Boleto",
                          "date": "2018-08-01",
                          "value": -200
                        },
                        {
                          "title": "TED Recebida",
                          "desc": "Salário",
                          "date": "2018-08-21",
                          "value": 1400.5
                        }
                      ],
                      "error": {}
                    }
        """.data(using: .utf8)
        
        if let data = data, let transactionResult = try? JSONDecoder().decode(TransactionResult.self, from: data) {
            return transactionResult
        }
        return .init(statementList: [], error: AuthError())
    }

    var transactionResultWithError: TransactionResult {
        return .init(statementList: [], error: .init(code: 53, message: "Usuário não encontrado"))
    }
    
    var identifierWithFailure: String {
        return "1q"
    }
}
