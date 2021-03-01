//
//  StatementsWorkerMock.swift
//  BankApp-DesafioTests
//
//  Created by Mizia Lima on 2/28/21.
//

import Foundation
@testable import BankApp_Desafio

class StatementsWorkerMock: StatementsWorker {
    var fetchStatementsIsCalled: Bool = false
    var isSuccesCase: Bool = true
    
    override func fetchStatementsList(completion: @escaping (Result<Statements.Response, ServiceError>) -> Void) {
        self.fetchStatementsIsCalled = true
        
        if isSuccesCase {
            let response = StatementsResponseMock.fetchStatements()
            completion(.success(response))
        } else {
            completion(.failure(.invalidData))
        }
    }
}
