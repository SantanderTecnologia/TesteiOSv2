//
//  StatementUserInteractor.swift
//  BankApp
//
//  Created by Visão Grupo on 7/20/19.
//  Copyright © 2019 Vinicius Teixeira. All rights reserved.
//

import Foundation

protocol StatementUserBusinessLogic {
    func fecthStatement(_ request: StatementUser.FetchStatement.Request)
}

protocol StatementUserDataStore {
    var user: User! {get set}
}

class StatementUserInteractor: StatementUserBusinessLogic, StatementUserDataStore {
    
    var user: User!
    var worker: StatementWorker?
    var presenter: StatementUserPresentationLogic?
    
    
    // MARK: Fecth statement
    
    func fecthStatement(_ request: StatementUser.FetchStatement.Request) {
        worker = StatementWorker(StatementAPI())
        worker?.fetchStatement(request.userId) { (statements: [Statement]) in
            let response = StatementUser.FetchStatement.Response(statements: statements)
            DispatchQueue.main.async {
                self.presenter?.presentStatementUser(response)
            }
        }
    }
    
}
