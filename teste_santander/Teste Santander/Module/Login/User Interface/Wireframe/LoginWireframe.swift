//
//  LoginWireframe.swift
//  Teste Santander
//
//  Created by THIAGO on 02/07/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import UIKit

class LoginWireframe {
    
    var window: UIWindow?
    
    var loginViewController: LoginViewController?
    
    func makeScreen(window: UIWindow?) -> LoginViewController {
         let viewController = LoginViewControllerBuilder().makeScreen(wireframe: self)
        loginViewController = viewController
        self.window = window
        return viewController
    }
    
    func showDetailUser() {
        window?.rootViewController = HomeWireframe().makeScreen(window: window)
    }
}
