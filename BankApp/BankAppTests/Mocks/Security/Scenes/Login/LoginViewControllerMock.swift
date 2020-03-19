//
//  LoginViewControllerMock.swift
//  BankAppTests
//
//  Created by José Inácio Athayde Ferrarini on 19/03/20.
//  Copyright © 2020 br.com.solutis.inacioferrarini. All rights reserved.
//

import UIKit
@testable import BankApp

class LoginViewControllerMock: UIViewController, LoginDisplayLogic {

    var viewModel: Login.Authentication.ViewModel? = nil
    
    func authenticationComplete(viewModel: Login.Authentication.ViewModel) {
        self.viewModel = viewModel
    }
    
}
