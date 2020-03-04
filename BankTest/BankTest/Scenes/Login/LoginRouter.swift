//
//  LoginRouter.swift
//  BankTest
//
//  Created by Luan Nascimento Almeida on 02/03/20.
//  Copyright (c) 2020 bank. All rights reserved.

import UIKit

protocol LoginRoutingLogic: class {
    func routeToDashboard(source: LoginDataStore)
}

protocol LoginDataPassing {
    var dataStore: AccountDataStore? { get }
}

class LoginRouter: NSObject, LoginRoutingLogic {
    weak var viewController: LoginViewController?

    func routeToDashboard(source: LoginDataStore) {
        let controller = AccountViewController()
        controller.loginResponse = source.loginResponse
        controller.modalPresentationStyle = .fullScreen
        controller.modalTransitionStyle = .flipHorizontal
        viewController?.present(controller, animated: true, completion: nil)
    }
}
