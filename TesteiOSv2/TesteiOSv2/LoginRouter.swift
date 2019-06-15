//
//  LoginRouter.swift
//  TesteiOSv2
//
//  Created by Felipe Rodrigues Silva on 15/01/19.
//  Copyright © 2019 Felipe Rodrigues Silva. All rights reserved.
//

import Foundation

class LoginRouter :LoginDataPassing, LoginRoutingLogic {
    var dataStore: LoginDataStore?
    
    //ViewController of LoginViewController. It's weak for ARC don't count more one reference
    weak var viewController: LoginViewController?
    
    /**
     Show this viewcontroller.
     */
    func routeToAccountDetail() {
        
        if let user = dataStore?.user, let loginViewController = viewController {
            let accountDetailViewController = AccountDetailViewController(user: user)
            loginViewController.show(accountDetailViewController,sender: nil)
        }
    }
    
}
