//
//  LoginPresenter.swift
//  BankApp
//
//  Created by Pedro Veloso on 19/05/19.
//  Copyright © 2019 pedrofveloso. All rights reserved.
//

import Foundation

class LoginPresenter {
    private weak var view: LoginViewDelegate?
    private var coordinator: LoginCoordinatorDelegate
    private var repository: LoginRepositoryDelegate
    
    init(coordinator: LoginCoordinatorDelegate, repository: LoginRepositoryDelegate) {
        self.coordinator = coordinator
        self.repository = repository
    }
    
    func isPasswordValid(password: String) -> Bool {
        let pattern = "^(?=.*[A-Z])(?=.*[a-z0-9])(?=.*[!@#$%^&*()_+=\\-{}|:;<>]).{3,}$"
        guard let regex = try? NSRegularExpression(pattern: pattern, options: []) else { return false }
        let match = regex.firstMatch(in: password, options: [], range: NSRange(location: 0, length: password.count))
        return match != nil
    }
    
}

extension LoginPresenter: LoginPresenterDelegate {
    func set(view: LoginViewDelegate) {
        self.view = view
    }
    
    func login(user: String?, password: String?) {
        guard let user = user, let password = password else { return }
        let params = [
            "user": user,
            "password": password
        ]
        
        view?.setLoadingHidden(isHidden: false)
        
        repository.fetch(params: params, success: { [weak self] loginModel in
            KeychainHelper.shared.set(string: user, forKey: KeychainHelperKeys.user)
            KeychainHelper.shared.set(string: password, forKey: KeychainHelperKeys.password)
            UserHelper.shared.initializeUser(login: loginModel)
            self?.coordinator.login()
            self?.view?.setLoadingHidden(isHidden: true)
        }) { [weak self] error in
            guard let view = self?.view else { return }
            view.setLoadingHidden(isHidden: true)
            view.showAlert(message: error.domain)
        }
    }
    
    func viewDidLoad() {
        guard let user = KeychainHelper.shared.get(key: KeychainHelperKeys.user),
            let password = KeychainHelper.shared.get(key: KeychainHelperKeys.password) else { return }
        view?.setFields(user: user, password: password)
    }
    
    func didEditFields(user: String?, password: String?) {
        guard let user = user, let password = password else { return }
        let shouldEnabledButton = !user.isEmpty && isPasswordValid(password: password)
        view?.setButtonEnabled(isEnabled: shouldEnabledButton)
    }

}
