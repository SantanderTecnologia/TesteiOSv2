//
//  StatementListMock.swift
//  BankAppTests
//
//  Created by José Inácio Athayde Ferrarini on 19/03/20.
//  Copyright © 2020 br.com.solutis.inacioferrarini. All rights reserved.
//

import Foundation
@testable import BankApp

class StatementListWorkerMock: StatementListWorker {

    var fetchStatementsClojure: (() -> (Result<StatementList.Statements.Response?, Error>))
    
    init(_ fetchStatementsClojure: @escaping (() -> (Result<StatementList.Statements.Response?, Error>))) {
        self.fetchStatementsClojure = fetchStatementsClojure
    }
    
    override func fetchStatements(completion: @escaping ((Result<StatementList.Statements.Response?, Error>) -> Void)) {
        let result = fetchStatementsClojure()
        completion(result)
    }

}
