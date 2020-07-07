//
//  LoginPresenter.swift
//  Accenture-Challenge
//
//  Created by Pedro Alvarez on 04/07/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

protocol LoginPresentationLogic {
    var viewController: LoginDisplayLogic? { get set }
    
    func didFetchLoginResponse()
    func invalidEmailRequest()
    func invalidpasswordRequest()
    func didFetchError(_ errorMessage: String)
    func didFetchLoginInfo(_ response: Login.Saves.User)
}

class LoginPresenter: LoginPresentationLogic {
    
    weak var viewController: LoginDisplayLogic?
    
    func didFetchLoginResponse() {
        viewController?.routeToPayments()
    }
    
    func invalidEmailRequest() {
        viewController?.displayLoginError(message: Login.Constants.Errors.invalidEmail)
    }
    
    func invalidpasswordRequest() {
        viewController?.displayLoginError(message: Login.Constants.Errors.invalidpassword)
    }
    
    func didFetchError(_ errorMessage: String) {
        viewController?.displayErrorAlert(message: errorMessage)
    }
    
    func didFetchLoginInfo(_ response: Login.Saves.User) {
        viewController?.displayLoginInfo(response)
    }
}
