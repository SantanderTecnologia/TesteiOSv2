//
//  AccountRouter.swift
//  Santander Teste iOS
//
//  Created by Lucas Ferraciolli Assis on 17/06/19.
//  Copyright © 2019 Lucas Conte. All rights reserved.
//

import Foundation

protocol AccountRoutingLogic {
    func routeToLoginViewController()
}

protocol AccountDataPassing {
    var dataStore: AccountDataStore? { get }
}

class AccountRouter: NSObject, AccountRoutingLogic, AccountDataPassing {
    weak var viewController: AccountViewController?
    var dataStore: AccountDataStore?
    
    func routeToLoginViewController() {
        let loginViewController = LoginViewController()
        self.viewController?.present(loginViewController, animated: true, completion: nil)
    }
}
