//
//  TransactionsUseCaseProtocol.swift
//  Domain
//
//  Created by Estaife Lima on 07/06/20.
//  Copyright © 2020 Estaife Lima. All rights reserved.
//

import Foundation

public protocol TransactionsUseCaseProtocol {
    func getTransactions(identifier: String, completion: @escaping (Result<TransactionResult, DomainError>) -> Void)
}
