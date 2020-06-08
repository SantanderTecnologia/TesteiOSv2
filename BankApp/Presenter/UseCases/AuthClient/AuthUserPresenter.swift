//
//  AuthUserPresenter.swift
//  Presenter
//
//  Created by Estaife Lima on 03/06/20.
//  Copyright © 2020 Estaife Lima. All rights reserved.
//

import Foundation
import Domain
import Keychain

public final class AuthUserPresenter {
    private let keychain = Keychain()
    
    private let alertView: AlertViewProtocol
    private let userNameValidate: UserNameValidateProtocol
    private let passwordValidate: UserNameValidateProtocol
    private let authClientUseCase: AuthClientUseCaseProtocol
    private let loadingView: LoadingViewProtocol
    private let router: RouterProtocol
    private let retrieveCredentials: RetrieveCredentialsProtocol
    
    public init(alertView: AlertViewProtocol,
                loadingView: LoadingViewProtocol,
                userNameValidate: UserNameValidateProtocol,
                passwordValidate: UserNameValidateProtocol,
                authClientUseCase: AuthClientUseCaseProtocol,
                router: RouterProtocol,
                retrieveCredentials: RetrieveCredentialsProtocol) {
        self.alertView = alertView
        self.loadingView = loadingView
        self.userNameValidate = userNameValidate
        self.passwordValidate = passwordValidate
        self.authClientUseCase = authClientUseCase
        self.router = router
        self.retrieveCredentials = retrieveCredentials
        
        retriveCredentials()
    }
    
    public func auth(viewModel: AuthUserViewModel) {
        userNameValidate.isValid(userName: viewModel.userName)
        
        if let viewModel = errorViewModel(viewModel) {
            alertView.presentMessageWith(viewModel)
        } else {
            loadingView.start()
            
            guard let authClientModel = viewModel.authClientModel else { return }
            authClientUseCase.login(authenticationModel: authClientModel) { [weak self] result in
                guard let self = self else { return }
                
                self.loadingView.stop()
                
                switch result {
                case .failure(let error):
                    self.alertView.presentMessageWith(.init(title: "Fail", message: error.localizedDescription))
                case .success(let userAccountModel):
                    guard let model = self.makeUserAccontModel(userAccountModel.userAccount) else {
                        self.alertView.presentMessageWith(.init(title: "Fail", message: "An unexpected error occurred, try again"))
                        return
                    }
                    self.router.presentBalanceViewController(userAccount: model)
                    self.saveLoginUser(viewModel: viewModel)
                }
            }
        }
    }
    
    private func errorViewModel(_ viewModel: AuthUserViewModel) -> AlertViewModel? {
        var title = "Fail in auth the user"
        var message = ""
        if !StringCheck.isValidField(viewModel.password) {
            message = "The field Password is mandatory"
        } else if !StringCheck.isValidField(viewModel.userName) {
            message = "The field User Name is mandatory"
        } else if !userNameValidate.isValid(userName: viewModel.userName) {
            title = "The field User Name is wrong"
            message = "You should put an email or cpf valid"
        } else if !passwordValidate.isValid(userName: viewModel.password) {
            title = "Your password does not meet prerequisites"
            message = "Should contains an Uppercase letter, a number and special character"
        } else {
            return nil
        }
        return .init(title: title, message: message)
    }
    
    private func makeUserAccontModel(_ userAccountResult: UserAccountInternalResponse) -> UserAccountModel? {
        guard let identifier = userAccountResult.userID,
            let name = userAccountResult.name,
            let bankAccount = userAccountResult.bankAccount,
            let agency = userAccountResult.agency,
            let balance = userAccountResult.balance else { return nil }
        return .init(identifier: String(identifier), name: name, bankAccount: bankAccount, agency: agency, balance: balance)
    }
    
    private func saveLoginUser(viewModel: AuthUserViewModel) {
        guard let key = viewModel.userName, let password = viewModel.password else { return }
        keychain.save(password: password, key: key)
    }
    
    private func retriveCredentials() {
        guard let userName = keychain.lastKey() else { return }
        let password = keychain.retrieve(key: userName)
        retrieveCredentials.resultWith(credentials: AuthUserViewModel(userName: userName, password: password))
    }
}
