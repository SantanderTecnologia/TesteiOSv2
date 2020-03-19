//
//  StatementListPresenter.swift
//  BankApp
//
//  Created by José Inácio Athayde Ferrarini on 17/03/20.
//  Copyright (c) 2020 br.com.solutis.inacioferrarini. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol StatementListPresentationLogic {
    func fetchSuccess(response: StatementList.Statements.Response?)
    func fetchError(error: String?)
}

class StatementListPresenter: StatementListPresentationLogic {
    weak var viewController: StatementListDisplayLogic?

    // MARK: Do something

    func fetchSuccess(response: StatementList.Statements.Response?) {
        let viewModel = StatementList.Statements.ViewModel(statementList: response?.statementList,
                                                           errorMessage: nil)
        viewController?.fetchStatementsComplete(viewModel: viewModel)
    }
    
    func fetchError(error: String?) {
        let viewModel = StatementList.Statements.ViewModel(statementList: nil,
                                                           errorMessage: error)
        viewController?.fetchStatementsComplete(viewModel: viewModel)
    }
    
}
