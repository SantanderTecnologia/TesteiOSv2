//
//  StatementUserPresenter.swift
//  BankApp
//
//  Created by Visão Grupo on 7/20/19.
//  Copyright © 2019 Vinicius Teixeira. All rights reserved.
//

import Foundation

protocol StatementUserPresentationLogic {
    func presentStatementUser(_ response: StatementUser.FetchStatement.Response)
}

class StatementUserPresenter: StatementUserPresentationLogic {
    
    weak var viewController: StatementUserDisplayLogic?
    
    func presentStatementUser(_ response: StatementUser.FetchStatement.Response) {
        let viewModel = StatementUser.FetchStatement.ViewModel(statements: response.statements)
        viewController?.displayStatement(viewModel)
    }
    
}
