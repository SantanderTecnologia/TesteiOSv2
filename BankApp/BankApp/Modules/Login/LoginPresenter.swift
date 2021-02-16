//
//  LoginPresenter.swift
//  BankApp
//
//  Created by Bruno Maciel on 1/16/21.
//

import Foundation

class LoginPresenter {
    
    weak var view: LoginPresenterDelegate?
    var router: LoginRouter?
    
    
}


// MARK: - Access from Interactor

extension LoginPresenter: LoginPresenterProtocol {
    func didFailToValidate(_ message: String) {
        view?.showValidationError(message)
    }
    
    func startRequest() {
        view?.startRequesting()
    }
    
    func finishRequest() {
        view?.finishRequesting()
    }
    
    func didLoginWithSuccess(response: LoginModels.Response) {
        let viewModel = LoginModels.ViewModel(userInfo: response.userInfo)
        
        view?.clearFields()
        router?.didLogin(data: viewModel)
    }
    
    func loginDidFail(_ errorMessage: String) {
        view?.showLoginError(errorMessage)
    }
    
    func hasUserInfoSaved(_ localDataSaved: Bool) {
        (localDataSaved) ? view?.presentUserSavedLocally() : view?.hideUserSavedLocally()
    }
}
