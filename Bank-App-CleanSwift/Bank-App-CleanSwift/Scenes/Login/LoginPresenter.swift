//
//  LoginPresenter.swift
//  Bank-App-CleanSwift
//
//  Created by Adriano Rodrigues Vieira on 15/03/21.
//

import Foundation

protocol LoginPresentationLogic: class {
    func presentLoginResult(response: Login.Login.Response)
    func presentLastLoggedUser(response: Login.FetchLastLoggedUser.Response)
}

class LoginPresenter: LoginPresentationLogic {
    weak var viewController: DisplayLoginLogic!
        
    /// Passes the result of the login to the view controller
    /// - Parameter response: a `Response` object
    func presentLoginResult(response: Login.Login.Response) {        
        let viewModel = Login.Login.ViewModel(user: response.user, error: response.error)                
        
        viewController.displayLoginResult(viewModel: viewModel)
    }
    
    /// Presents the last  logged in `User`'s `username`
    /// - Parameter response: a `Response` object
    func presentLastLoggedUser(response: Login.FetchLastLoggedUser.Response) {        
        let viewModel = Login.FetchLastLoggedUser.ViewModel(username: response.username)
        
        viewController.setUsernameTextWithLastUserLoggedIn(with: viewModel)
    }
}
