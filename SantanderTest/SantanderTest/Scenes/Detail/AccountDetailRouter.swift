//
//  AccountDetailRouter.swift
//  SantanderTest
//
//  Created by Maria Eugênia Pereira Teixeira on 26/07/20.
//  Copyright (c) 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import UIKit

protocol AccountDetailRoutingLogic {
    func routeToLogin()
}

protocol AccountDetailDataPassing {
    var dataStore: AccountDetailDataStore? { get }
}

class AccountDetailRouter: NSObject, AccountDetailRoutingLogic, AccountDetailDataPassing {
    weak var viewController: AccountDetailViewController?
    var dataStore: AccountDetailDataStore?
    
    func routeToLogin() {
        viewController?.dismiss(animated: true, completion: nil)
    }
}
