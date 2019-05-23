//
//  LoginCoordinator.swift
//  BankApp
//
//  Created by Pedro Veloso on 19/05/19.
//  Copyright © 2019 pedrofveloso. All rights reserved.
//

import UIKit

class LoginCoordinator: CoordinatorDelegate {
    var rootViewController: UIViewController?
    
    var navigation: UINavigationController
    
    func start() {
        let login = UIViewController.loadNib(as: LoginViewController.self)
        let presenter = LoginPresenter(coordinator: self, repository: LoginRepository())
        login.presenter = presenter
        
        navigation.pushViewController(login, animated: false)
    }
    
    required init(nav: UINavigationController, root: UIViewController?) {
        navigation = nav
        rootViewController = root
    }
}

extension LoginCoordinator: LoginCoordinatorDelegate {
    func login() {
        DispatchQueue.main.async {
            AppDelegate.instance?.appCoordinator?.update(to: .main)
        }
    }
}
