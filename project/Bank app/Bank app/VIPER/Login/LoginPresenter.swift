//
//  LoginPresenter.swift
//  Bank app
//
//  Created by mmalaqui on 18/05/2020.
//  Copyright © 2020 everis. All rights reserved.
//

import Foundation
import UIKit

protocol LoginPresenterProtocol: AnyObject {
    var viewModel: LoginViewModel? { get set }
    func performLogin()
    func updateViewModel(password: String? , username: String?)
    func viewDidLoad()
    func cleanup()
}

final class LoginPresenter: BasePresenter<LoginView, LoginRouterProtocol, LoginInteractorProtocol>, LoginPresenterProtocol {
    var viewModel: LoginViewModel?
    
    func performLogin(){
        
        var canPerformLogin = true
        //Base textfield validations
        if self.view?.usernameTextfield.text == nil || self.view?.usernameTextfield?.text?.isEmpty == true{
            self.view?.usernameTextfield.setState(state: false)
            canPerformLogin = false
        }else{
             self.view?.usernameTextfield.setState(state: true)
        }
        
        if self.view?.passwordTextfield.text == nil || self.view?.passwordTextfield?.text?.isEmpty == true{
            self.view?.passwordTextfield.setState(state: false)
            canPerformLogin = false
        }else{
             self.view?.passwordTextfield.setState(state: true)
        }
        
        if (canPerformLogin == false) {
            return
        }
        //Interactor call
        if let username =  self.view?.usernameTextfield.text, let password =  self.view?.passwordTextfield.text {
            self.view?.showLoader()
            self.interactor?.performLogin(username: username, password: password, completion: {(loginInteractorModel : LoginInteractorModel?, _ error: LoginInteractorError?) -> Void in
                if let error = error {
                    switch error {
                    case .noValidPasswordError:
                        DispatchQueue.main.async {
                            self.view?.hideLoader()
                            self.view?.passwordTextfield.setState(state: false)
                        }
                        break
                    case .customServerError(let message):
                        DispatchQueue.main.async {
                            self.view?.hideLoader()
                            self.view?.handleError(message: message)
                        }
                        break
                    case .internetError:
                        DispatchQueue.main.async {
                            self.view?.hideLoader()
                            self.view?.handleError(message: "noInternetError".localized)
                        }
                        break
                    default:
                        DispatchQueue.main.async {
                            "Found error \(error)".errorLog()
                            self.view?.hideLoader()
                            self.view?.handleDefaultError()
                        }
                        break
                    }
                    return
                }
                if let user = loginInteractorModel{
                    DispatchQueue.main.async {
                        self.view?.hideLoader()
                        self.viewModel = nil 
                        self.router?.presentDetailView(user: user)
                    }
                    return
                }
                
                DispatchQueue.main.async {
                    "error and user are nil".errorLog()
                    self.view?.hideLoader()
                    self.view?.handleDefaultError()
                }
            })
        }
    }
    
    func updateViewModel(password: String? , username: String?){
        if let password = password, let username = username {
            self.viewModel = LoginViewModel()
            self.viewModel?.username = username
            self.viewModel?.password = password
        }
    }
    
    func viewDidLoad(){
        if let viewModel = self.viewModel{
            self.view?.usernameTextfield.text = viewModel.username
            self.view?.passwordTextfield.text = viewModel.password

        }
    }
    
    
    func cleanup(){
        self.interactor?.cleanup()
    }
}
