//
//  TransactionPresenter.swift
//  Presenter
//
//  Created by Estaife Lima on 07/06/20.
//  Copyright © 2020 Estaife Lima. All rights reserved.
//

import Foundation
import Domain

public final class TransactionPresenter {
    private let transactionUseCase: TransactionsUseCaseProtocol
    private let loadingView: LoadingViewProtocol
    
    public init(loadingView: LoadingViewProtocol, transactionUseCase: TransactionsUseCaseProtocol) {
        self.transactionUseCase = transactionUseCase
        self.loadingView = loadingView
    }
    
    private func makeTransactions(result: TransactionResult) -> [TransactionModel] {
        return result.statementList.map {
            return TransactionModel(title: $0.title, description: $0.desc, date: $0.date, value: $0.value)
        }
    }
    
    public func getTransactions(identifier: String, completion: @escaping ([TransactionModel]) -> Void) {
        loadingView.start()
        
        transactionUseCase.getTransactions(identifier: identifier) { [weak self] result in
            guard let self = self else { return }
            
            self.loadingView.stop()
            
            switch result {
            case .success(let resultModel):
                completion(self.makeTransactions(result: resultModel))
            case .failure:
                completion([])
            }
        }
    }
}
