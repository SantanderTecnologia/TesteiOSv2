//
//  AppFactoryImplementation.swift
//  UserInterface
//
//  Created by Estaife Lima on 06/06/20.
//  Copyright © 2020 Estaife Lima. All rights reserved.
//

import UIKit
import Domain
import Presenter
import Validator
import Data
import Networking

public class AppFactoryImplementation: AppFactory {
    
    public init() { }
    
    public func makeLoginViewController() -> LoginViewController {
        let endpoint: UseCasesEndpoint = .login
        guard let url = endpoint.url else { return .init() }
        
        let loginVC = LoginViewController()
        let userNameValidate = UserNameValidate()
        let passwordValidate = PasswordValidate()
        let authClientUseCase = AuthClientUseCase(url: url, httpClient: AlamofireAdapter())
        let authPresenter = AuthUserPresenter(alertView: loginVC,
                                              loadingView: loginVC,
                                              userNameValidate: userNameValidate,
                                              passwordValidate: passwordValidate,
                                              authClientUseCase: authClientUseCase,
                                              router: loginVC,
                                              retrieveCredentials: loginVC)
        loginVC.loginBlock = authPresenter.auth
        
        return loginVC
    }
    
    public func makeBalanceViewController(userAccount: UserAccountModel) -> BalanceViewController {
        let endpoint: UseCasesEndpoint = .transactions
        guard let url = endpoint.url else {
            return .init(userAccount: UserAccountModel(identifier: "", name: "", bankAccount: "", agency: "", balance: 0.0))
        }
        
        let balanceVC = BalanceViewController(userAccount: userAccount)
        let transactionsUseCase = TransactionsUseCase(url: url, httpClient: AlamofireAdapter())
        let trasactionPresenter = TransactionPresenter(loadingView: balanceVC, transactionUseCase: transactionsUseCase)
        balanceVC.getTransactionsBlock = trasactionPresenter.getTransactions
        return balanceVC
    }
}
