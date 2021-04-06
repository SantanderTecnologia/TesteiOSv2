//
//  LoginInteractor.swift
//  Bank-App-CleanSwift
//
//  Created by Adriano Rodrigues Vieira on 15/03/21.
//

import Foundation

protocol LoginBusinessLogic: class {
    func doTryLogin(request: Login.Login.Request)
    func fetchLastLoggedUsername(request: Login.FetchLastLoggedUser.Request)
}

protocol UserAccountDataStore: class {
    var userAccount: UserAccount! { get set }
}

class LoginInteractor: LoginBusinessLogic, UserAccountDataStore {
    var presenter: LoginPresentationLogic!
    var fieldsValidationWorker: LoginFieldsValidationWorker!
    var httpRequestWorker: LoginHTTPRequestWorker!
    var loginStorageWorker: LoginStorageWorker!
    
    var userAccount: UserAccount!
            
    /// Apply some business login in the fields (a.k.a. `username` and `password`) inside the `request` object.
    /// - Parameter request: a `request` object populated by `viewController`
    func doTryLogin(request: Login.Login.Request) {
        let user = User(username: request.fields.username,
                        password: request.fields.password)
                
        let isUserValidBasedOnFields = self.validateFields(of: user)
        
        if isUserValidBasedOnFields {
            httpRequestWorker = LoginHTTPRequestWorker()
            httpRequestWorker.doLogin(with: user) { data in
                DispatchQueue.main.async {
                    var userAccount: UserAccount?
                    var errorMessage: ErrorMessage?
                    
                    if let _ = data.userAccount.userId {
                        userAccount = UserAccount(extractedFrom: data)
                        // Save object in interactor
                        self.userAccount = userAccount
                        
                        // Save logged user in storage
                        self.loginStorageWorker = LoginStorageWorker(storage: UserDefaultsStorage())
                        let _ = self.loginStorageWorker.persistUsername(user.username)
                    }
                    if let _ = data.error.code {
                        errorMessage = ErrorMessage(extractedFrom: data)
                    }
                    
                    let response = Login.Login.Response(user: userAccount, error: errorMessage)
                    self.presenter.presentLoginResult(response: response)
                }
            }
        } else {            
            self.presenter.presentLoginResult(response: Constants.USER_OR_PASSWORD_INVALID_RESPONSE)            
        }
    }
        
    /// Delegates the validation for the `LoginFieldsValidationWorker` object.
    /// - Parameter user: the `User` object which has `username` and `password` properties.
    /// - Returns: `true` if the fields satisfies the preconditions; false if `username`, `password` or both does not satisfy the preconditions.
    private func validateFields(of user: User) -> Bool {
        fieldsValidationWorker = LoginFieldsValidationWorker()
        return fieldsValidationWorker.validate(user: user)
    }
    
    
    /// Fetch the last logged username logged in
    /// - Parameter request: an empty request (as hook, for later implementation)
    func fetchLastLoggedUsername(request: Login.FetchLastLoggedUser.Request) {
        loginStorageWorker = LoginStorageWorker(storage: UserDefaultsStorage())
        let lastUsername = loginStorageWorker.fetchLastLoggedUsername()
        
        let response = Login.FetchLastLoggedUser.Response(username: lastUsername)
        presenter.presentLastLoggedUser(response: response)
    }
}
