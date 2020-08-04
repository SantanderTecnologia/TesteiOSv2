//
//  LoginInteractor.swift
//  Teste_iOS_v2
//
//  Created by Lucas Fernandes Araujo on 30/07/20.
//  Copyright © 2020 Lucas Fernandes Araujo. All rights reserved.
//

import UIKit

protocol LoginBusinessLogic: AnyObject {
    func retrieveLastLoggedUser()
    func validateLogin(username: String?, password: String?)
}

extension LoginInteractor: LoginBusinessLogic {
    func retrieveLastLoggedUser() {
        worker?.retrieveLastLoggedUser(completion: handleLastLoggedUser)
    }
    
    func validateLogin(username: String?, password: String?) {
        validateLogin(username, password)
    }
}

class LoginInteractor: NSObject {
    var presenter: LoginPresentationLogic?
    var worker: LoginWorkerLogic?
    private var user: String = String()
    
    init(presenter: LoginPresentationLogic, worker: LoginWorkerLogic) {
        self.presenter = presenter
        self.worker = worker
    }
    
    private func validateLogin(_ username: String?, _ password: String?) {
        guard let user = username, let pass = password, !user.isEmpty, !pass.isEmpty else {
            presenter?.presentUncompletedFieldsError()
            return
        }
        if isValidUsername(user) && isValidPassword(pass) {
            self.user = user
            worker?.makeLogin(model: .init(login: .init(user: user, password: pass),
                                           success: success,
                                           failure: failure))
        } else {
            presenter?.presentWrongFieldsError()
        }
    }
    
    private func isValidUsername(_ username: String) -> Bool {
        return username.isValidEmail() || username.isValidCPF()
    }
    
    private func isValidPassword(_ password: String) -> Bool {
        return password.hasNumbers()
            && password.hasCapitalLetters()
            && password.hasSpecialCharacters()
    }
    
    private lazy var handleLastLoggedUser: UserDefaultsReturn = { [weak self] object in
        guard let self = self,
            let user = object as? String else { return }
        self.presenter?.presentLastLoggedUser(user)
    }
    
    private lazy var success: GenericResponse = { [weak self] data in
        guard let self = self else { return }
        do {
            let response = try JSONDecoder().decode(LoginResponse.self, from: data)
            self.presenter?.presentSuccessLogin(model: .init(response: response))
            self.worker?.saveUserLocally(self.user)
        } catch {
            self.presenter?.presentAuthenticationError()
        }
    }
    
    private lazy var failure: EmptyClosure = { [weak self]  in
        guard let self = self else { return }
        self.presenter?.presentAuthenticationError()
    }
}
