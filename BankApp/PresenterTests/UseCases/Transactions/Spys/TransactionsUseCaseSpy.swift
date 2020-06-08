//
//  TransactionsUseCaseSpy.swift
//  PresenterTests
//
//  Created by Estaife Lima on 07/06/20.
//  Copyright © 2020 Estaife Lima. All rights reserved.
//

import Domain
import Presenter

class TransactionsUseCaseSpy {
    
    var transactionResult: TransactionResult?
    var completion: ((Result<TransactionResult, DomainError>) -> Void)?
    
    func completeWithoutTransactions() {
        completion?(.success(TransactionResult(statementList: [], error: AuthError())))
    }
    
    func completeWith(transactionResult: TransactionResult) {
        completion?(.success(transactionResult))
    }
}

extension TransactionsUseCaseSpy: TransactionsUseCaseProtocol {
    func getTransactions(identifier: String, completion: @escaping (Result<TransactionResult, DomainError>) -> Void) {
        self.completion = completion
    }
}
