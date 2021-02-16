//
//  StatementsProtocols.swift
//  BankApp
//
//  Created by Bruno Maciel on 1/16/21.
//

import Foundation

/// View -> Interactor
protocol StatementsInteractorProtocol: AnyObject {
    func viewDidLoad()
    func tryFetchAgain()
    func logout()
}

/// Interactor -> Presenter
protocol StatementsPresenterProtocol: AnyObject {
    func presentUserInfo(_ userInfo: StatementsModels.UserInfoResponse)
    func logout()
    
    func startRequest()
    func finishRequest()
    
    func presentFetchedStatements(response: StatementsModels.Response)
    func didFailToFetchStatement(_ errorMessage: String)
}

/// Presenter -> View
protocol StatementsPresenterDelegate: AnyObject {
    func showUserInfo(_ userViewModel: StatementsModels.UserInfoViewModel)
    
    func startRequesting()
    func finishRequesting()
    
    func displayStatements(viewModel: StatementsModels.ViewModel)
    func zeroStatementsFound(viewModel: StatementsModels.ViewModel)
    func showFailToFetchStatements(_ errorMessage: String)
}
