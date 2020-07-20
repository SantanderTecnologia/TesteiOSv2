//
//  LoginPresenter.swift
//  TCS_Challenge
//
//  Created by Rafael Valer on 13/07/20.
//  Copyright © 2020 Rafael Valer. All rights reserved.
//

import Foundation

protocol LoginPresentationLogic {
    func presentLoginError(error: Error)
    func presentAccountDetails()
    func presentInvalidUser()
    func presentInvalidPassword()
    func presentLastLoggedUser(response: Login.FetchLastLoggedUser.Response)
}

class LoginPresenter: LoginPresentationLogic {
    
    weak var viewController: LoginDisplayLogic?
    
    func presentLoginError(error: Error) {
        viewController?.displayErrorMessage(withTitle: "Error", message: error.localizedDescription)
    }
    
    func presentAccountDetails() {
        self.viewController?.showAccountDetails()
    }
    
    func presentInvalidUser() {
        viewController?.displayErrorMessage(withTitle: "Invalid User",
                                            message: "User field should be an email or CPF.")
    }
    
    func presentInvalidPassword() {
        viewController?.displayErrorMessage(withTitle: "Invalid Password",
                                            message: "Password must contain at least one upper case letter, one special char, and one alphanumeric value.")
    }
    
    func presentLastLoggedUser(response: Login.FetchLastLoggedUser.Response) {
        viewController?.displayLastLoggedUser(response.user)
    }
}
