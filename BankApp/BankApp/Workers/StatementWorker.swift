//
//  StatementWorker.swift
//  BankApp
//
//  Created by Visão Grupo on 23/07/19.
//  Copyright © 2019 Vinicius Teixeira. All rights reserved.
//

import Foundation

class StatementWorker {
    
    var statementStore: StatementStoreProtocol
    
    init(_ statementStore: StatementStoreProtocol) {
        self.statementStore = statementStore
    }
    
    func fetchStatement(_ id: Int, completionHandler: @escaping ([Statement]) -> Void) {
        statementStore.fetchStatements(id, completionHandler: completionHandler)
    }
}

protocol StatementStoreProtocol {
    func fetchStatements(_ id: Int, completionHandler: @escaping ([Statement]) -> Void)
}

