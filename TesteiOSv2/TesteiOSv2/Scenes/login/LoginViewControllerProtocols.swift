//
//  LoginViewControllerProtocols.swift
//  TesteiOSv2
//
//  Created by Foliveira on 03/06/20.
//  Copyright © 2020 Foliveira. All rights reserved.
//

import Foundation
import UIKit

protocol LoginViewControllerProtocol {
    func showUserData(data: UserInfo?)
}

extension LoginViewController: LoginViewControllerProtocol {
    
    func showUserData(data: UserInfo?) {
        
        
        DispatchQueue.main.async {
            LoginRouter.navigateToStatements(controller: self, data: data)
        }
    }
}
