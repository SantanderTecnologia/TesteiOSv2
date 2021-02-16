//
//  LoginProtocols.swift
//  BankApp
//
//  Created by Bruno Maciel on 1/16/21.
//

import Foundation

protocol LoginFormProtocol {
    var username: String? { get }
    var password: String? { get }
}

/// View -> Interactor
protocol LoginInteractorProtocol: AnyObject {
    func viewWillAppear()
    func login(_ loginForm: LoginFormProtocol)
}

/// Interactor -> Presenter
protocol LoginPresenterProtocol: AnyObject {
    func didFailToValidate(_ message: String)
    
    func startRequest()
    func finishRequest()
    
    func didLoginWithSuccess(response: LoginModels.Response)
    func loginDidFail(_ errorMessage: String)
    
    func hasUserInfoSaved(_ localDataSaved: Bool)
}

/// Presenter -> View
protocol LoginPresenterDelegate: AnyObject {
    func startRequesting()
    func finishRequesting()
    
    func showValidationError(_ errorMessage: String)
    func showLoginError(_ errorMessage: String)
    
    func clearFields()
    
    func presentUserSavedLocally()
    func hideUserSavedLocally()
}
