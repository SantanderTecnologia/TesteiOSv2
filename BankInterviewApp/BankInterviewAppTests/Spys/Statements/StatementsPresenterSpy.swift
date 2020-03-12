//
//  StatementsPresenterSpy.swift
//  BankInterviewAppTests
//
//  Created by Osias Carneiro on 11/03/20.
//  Copyright © 2020 Osias Carneiro. All rights reserved.
//

import Foundation

class StatementsPresenterSpy: StatementsPresentationLogic {
    
    var statementsList: Statements.StatementList.ViewModel?
    
    func presentFetchedStatements(response: Statements.StatementList.ViewModel) {
        statementsList = response
    }
    
}
