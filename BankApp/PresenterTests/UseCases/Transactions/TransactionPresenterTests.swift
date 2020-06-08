//
//  TransactionPresenterTests.swift
//  PresenterTests
//
//  Created by Estaife Lima on 07/06/20.
//  Copyright © 2020 Estaife Lima. All rights reserved.
//

import XCTest
import Domain
@testable import Presenter

class TransactionPresenterTests: XCTestCase {

    func testGetTransactionsSuccess() throws {
        
        //Given
        let transactionsUseCaseSpy = TransactionsUseCaseSpy()
        let sut = createSut(transactionsUseCaseSpy: transactionsUseCaseSpy)
        let transactionsWithSuccess = transactionResultWithSuccess.statementList.map {
            return TransactionModel(title: $0.title, description: $0.desc, date: $0.date, value: $0.value)
        }
        
        //Then
        let expectationTrasactiions = expectation(description: "Waiting get trasactions")
        sut.getTransactions(identifier: identifier) { transactions in
            XCTAssertEqual(transactionsWithSuccess, transactions)
            expectationTrasactiions.fulfill()
        }
        
        //When
        transactionsUseCaseSpy.completeWith(transactionResult: transactionResultWithSuccess)
        wait(for: [expectationTrasactiions], timeout: 1)
    }
    
    func testGetTransactionsFailure() throws {
        
        //Given
        let transactionsUseCaseSpy = TransactionsUseCaseSpy()
        let sut = createSut(transactionsUseCaseSpy: transactionsUseCaseSpy)
        
        //Then
        let expectationTrasactiions = expectation(description: "Waiting get trasactions")
        sut.getTransactions(identifier: identifier) { transactions in
            XCTAssertEqual([], transactions)
            expectationTrasactiions.fulfill()
        }
        
        //When
        transactionsUseCaseSpy.completeWithoutTransactions()
        wait(for: [expectationTrasactiions], timeout: 1)
    }
}

extension TransactionPresenterTests {
    
    func createSut(loadingViewSpy: LoadingViewSpy = LoadingViewSpy(),
                   transactionsUseCaseSpy: TransactionsUseCaseSpy = TransactionsUseCaseSpy(),
                   file: StaticString = #file,
                   line: UInt = #line) -> TransactionPresenter {
        let authUserPresenter = TransactionPresenter(loadingView: loadingViewSpy, transactionUseCase: transactionsUseCaseSpy)
        return authUserPresenter
    }
    
    var identifier: String {
        return "any_identifier"
    }
    
    var transactionResultWithSuccess: TransactionResult {
        return .init(statementList: [StatementList(title: "any_title", desc: "any_desc", date: "any_date", value: 0.0)],
                     error: .init(code: 53, message: "Usuário não encontrado"))
    }
    
    var transactionResultWithoutSuccess: TransactionResult {
        return .init(statementList: [], error: .init(code: 53, message: "Usuário não encontrado"))
    }
    
    var transactionResultWithError: TransactionResult {
        return .init(statementList: [], error: .init(code: 53, message: "Usuário não encontrado"))
    }
}
