//
//  TransactionsUseCase.swift
//  Data
//
//  Created by Estaife Lima on 07/06/20.
//  Copyright © 2020 Estaife Lima. All rights reserved.
//

import Foundation

import Domain

public final class TransactionsUseCase {
    private let url: URL
    private let httpClient: HTTPGetClient
    
    public init(url: URL, httpClient: HTTPGetClient) {
        self.url = url
        self.httpClient = httpClient
    }
    
    private func handleSuccess(_ data: Data?) -> Result<TransactionResult, DomainError> {
        if let model: TransactionResult = data?.convertToModel() {
            return .success(model)
        }
        return .failure(.convert)
    
    }
}

extension TransactionsUseCase: TransactionsUseCaseProtocol {
    public func getTransactions(identifier: String, completion: @escaping (Result<TransactionResult, DomainError>) -> Void) {
        httpClient.get(from: url.appendingPathComponent(identifier)) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                completion(self.handleSuccess(data))
            case .failure(_):
                completion(.failure(.unknown))
            }
        }
    }
}
