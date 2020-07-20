//
//  LoginInteractor.swift
//  TCS_Challenge
//
//  Created by Rafael Valer on 13/07/20.
//  Copyright © 2020 Rafael Valer. All rights reserved.
//

import Foundation

protocol LoginBusinessLogic {
    func fetchLogin(_ request: Login.Fetch.Request)
    func fetchLastLoggedUser()
}

protocol LoginDataStore {
    var loginResponse: Login.Fetch.Response? { get set }
}

class LoginInteractor: LoginBusinessLogic, LoginDataStore {
    
    var presenter: LoginPresentationLogic?
    var worker: LoginWorker = LoginWorker()
    
    var loginResponse: Login.Fetch.Response?
    
    // MARK: - LoginBusinessLogic
    func fetchLogin(_ request: Login.Fetch.Request) {
        
        guard isValidUser(request.user) else {
            presenter?.presentInvalidUser()
            return
        }
        
        guard isValidPassword(request.password) else {
            presenter?.presentInvalidPassword()
            return
        }
       
        worker.performLogin(request: request, completion: { (response) in
            switch response{
            case .success(let response):
                UserConfig.shared.loginUser = request.user
                self.loginResponse = response
                self.presenter?.presentAccountDetails()
                break
            case .error(let error):
                self.presenter?.presentLoginError(error: error)
                break
            case .nonSpecifiedError:
                break
            }
        })
    }
    
    func fetchLastLoggedUser() {
        guard let lastLoggedUser = UserConfig.shared.loginUser else {
            return
        }
        
        let response = Login.FetchLastLoggedUser.Response(user: lastLoggedUser)
        self.presenter?.presentLastLoggedUser(response: response)
    }
}

extension LoginInteractor {
    
    /// Checks the user field, should be a CPF or an email address
    /// - Parameter user: user login
    /// - Returns: boolean indicating if its a valid user account
    func isValidUser(_ user: String) -> Bool {
        guard !user.isEmpty,
            user.isValidEmail() || user.isValidCPF() else { return false }
        return true
    }
    
    /// Checks the password field, should contain at least one uppercased letter, one number, and one special character
    /// - Parameter password: user password
    /// - Returns: boolean indicating if its a valid password
    func isValidPassword(_ password: String) -> Bool {
        guard !password.isEmpty,
            password.containsUpperCaseLetter(),
            password.containsNumber(),
            password.containsSpecialCharacter() else { return false }
        return true
    }
}
