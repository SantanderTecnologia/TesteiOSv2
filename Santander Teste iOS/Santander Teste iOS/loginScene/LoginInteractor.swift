//
//  LoginInteractor.swift
//  Santander Teste iOS
//
//  Created by Lucas Ferraciolli Assis on 12/06/19.
//  Copyright © 2019 Lucas Conte. All rights reserved.
//

import Foundation

protocol LoginBusinessLogic {
    func validateLogin(username: String?, password: String?)
    func validateUser(user: Login.Auth) -> Bool
    func validatePassword(user: Login.Auth) -> Bool
}

protocol LoginDataStore {
    var auth: Login.Auth? { get }
}

class LoginInteractor: LoginBusinessLogic, LoginDataStore {
    var presenter: LoginPresentationLogic?
    var auth: Login.Auth?
    var worker = LoginWorker()
    
    func validateLogin(username: String?, password: String?) {
        guard let username = username, let password = password else { return }
        let auth = Login.Auth(user: username, password: password)
        
        self.presenter?.presentLoadingIndicator()
        if self.validateUser(user: auth) && self.validatePassword(user: auth) {
            self.worker.fetchLogin(auth: auth) { (response) in
                self.presenter?.dismissLoadingIndicator(completion: {
                    if let user = response?.userAccount {
                        self.presenter?.route(userAccount: user)
                        self.presenter?.erasePasswordTextField()
                    }
                })
            }
        } else {
            self.presenter?.dismissLoadingIndicator(completion: {
                self.presenter?.presentAlert(title: K.LoginScene.fail, message: K.LoginScene.wrongUserOrPassword)
                self.presenter?.erasePasswordTextField()
            })
        }
    }
    
    func validateUser(user: Login.Auth) -> Bool {
        let validation = user.user.isValidCPF || user.user.isValidEmail()
        if validation {
            UserDefaults.standard.set(user.user, forKey: K.UserDefaults.lastUserKey)
        }
        return validation
    }
    
    func validatePassword(user: Login.Auth) -> Bool {
        return user.password.isValidPassword()
    }
}
