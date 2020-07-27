//
//  LoginInteractor.swift
//  SantanderTest
//
//  Created by Maria Eugênia Pereira Teixeira on 24/07/20.
//  Copyright (c) 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper

protocol LoginBusinessLogic {
    func login(with request: Login.Request)
    func checkForSavedUser()
}

protocol LoginDataSource {
    var user: UserAccount? { get }
}

class LoginInteractor: LoginBusinessLogic, LoginDataSource {
    
    var user: UserAccount?
    var userID: Int?
    
    var presenter: LoginPresentationLogic?
    var worker: LoginNetworkLogic
    
    var userReceived: String?
    var passwordReceived: String?
    
    init(with worker: LoginNetworkLogic = LoginWorker()) {
        self.worker = worker
        user = .init()
    }
    
    //MARK: -
    //MARK: - PERFORM LOGIN
    func login(with request: Login.Request) {
        if !request.user.isEmpty, !request.password.isEmpty  {
            if request.password.isValidPassword {
                userReceived = request.user
                passwordReceived = request.password
                presenter?.shouldPresentLoading(true)
                worker.performLogin(with: request)
                    .done(handleSuccess)
                    .catch(handleError)
                    .finally { [weak self] in
                    self?.presenter?.shouldPresentLoading(false)
                }
            } else {
                presenter?.onError(title: Strings.Error.alertTitle, message: Strings.Error.invalidPassword)
            }
        } else {
            presenter?.onError(title: Strings.Error.alertTitle, message: Strings.Error.emptyFields)
        }
    }
    
    //MARK: -
    //MARK: - HANDLE SUCCESS
    func handleSuccess(response: Login.Response) {
        
        if let error = response.error?.message {
            presenter?.onError(title: Strings.Error.alertTitle, message: error)
        } else {
            if let user = userReceived, let pwd = passwordReceived {
                KeychainWrapper.standard.set(user, forKey: Constants.KeychainKeys.user)
                KeychainWrapper.standard.set(pwd, forKey: Constants.KeychainKeys.password)
            }
            user = response.userAccount
            presenter?.onSuccess()
        }
    }
    
    //MARK: -
    //MARK: - HANDLE ERROR
    func handleError(error: Error) {
        presenter?.onError(title: Strings.Error.alertTitle, message: error.localizedDescription)
    }
    
    //MARK: -
    //MARK: - CHECK USER
    func checkForSavedUser() {
        guard let retrivedUser = KeychainWrapper.standard.string(forKey: Constants.KeychainKeys.user),
            let retrivedPassword = KeychainWrapper.standard.string(forKey: Constants.KeychainKeys.password) else { return }
        presenter?.shouldPresentSaved(user: retrivedUser, and: retrivedPassword)
    }
}
