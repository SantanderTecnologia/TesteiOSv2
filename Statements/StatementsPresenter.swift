//
//  StatementsPresenter.swift
//  AppSantander
//
//  Created by Lucas Brandão Pereira on 05/04/19.
//  Copyright (c) 2019 Lucas Brandão Pereira. All rights reserved.


import UIKit

protocol StatementsPresentationLogic {
    func presentStatements(response: Statements.FetchStatements.Response)
    func presentUserInfo(response: Statements.PreviousScreen.Response)
}

class StatementsPresenter: StatementsPresentationLogic {
   
    weak var viewController: StatementsDisplayLogic?
  
    // MARK: Do something

    func presentStatements(response: Statements.FetchStatements.Response) {
        let viewModel = Statements.FetchStatements.ViewModel(statementsData: response.statementsData, numberOfitems: response.numberOfItems)
        viewController?.displayStatements(viewModel: viewModel)
    }
    
    func presentUserInfo(response: Statements.PreviousScreen.Response) {
        let viewModel = Statements.PreviousScreen.ViewModel(userInfo: response.userInfo)
        viewController!.displayUserinfo(viewModel: viewModel)
    }
    
}
