//
//  StatementWorker.swift
//  BankInterviewApp
//
//  Created by Osias Carneiro on 11/03/20.
//  Copyright © 2020 Osias Carneiro. All rights reserved.
//

class FetchStatementsWorker {
    
    var statementStore: StatementStoreProtocol
    
    init(store: StatementStoreProtocol) {
        self.statementStore = store
    }
    
    func fetchStatements(userId: Int, completionHandler: @escaping (StatementResponse) -> ()) {
        statementStore.fetchStatements(userId, completionHandler: completionHandler)
    }
    
}

protocol StatementStoreProtocol {
    func fetchStatements(_ userId: Int, completionHandler: @escaping (StatementResponse) -> ())
}
