//
//  LoginRouter.swift
//  Santander Teste iOS
//
//  Created by Lucas Ferraciolli Assis on 12/06/19.
//  Copyright © 2019 Lucas Conte. All rights reserved.
//

import Foundation

protocol LoginRoutingLogic {
    func routeToAccountViewController(userAccount: UserAccount)
}

protocol LoginDataPassing {
    var dataStore: LoginDataStore? { get }
}

class LoginRouter: NSObject, LoginRoutingLogic, LoginDataPassing {
    weak var viewController: LoginViewController?
    var dataStore: LoginDataStore?
    
    func routeToAccountViewController(userAccount: UserAccount) {
        let accountViewController = AccountViewController()
        accountViewController.interactor?.setUserAccount(userAccount: userAccount)
        self.viewController?.present(accountViewController, animated: true, completion: nil)
    }
}
