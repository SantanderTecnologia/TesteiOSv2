//
//  StatementsDisplayLogicSpy.swift
//  BankInterviewAppTests
//
//  Created by Osias Carneiro on 11/03/20.
//  Copyright © 2020 Osias Carneiro. All rights reserved.
//

class StatementsDisplayLogicSpy: StatementsDisplayLogic {
    
    var list: Statements.StatementList.ViewModel?
    
    func displayFetchedStatements(viewModel: Statements.StatementList.ViewModel) {
        list = viewModel
    }
    
}
