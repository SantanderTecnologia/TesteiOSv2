//
//  LoginPresenter.swift
//  AppSantander
//
//  Created by Lucas Brandão Pereira on 15/03/19.
//  Copyright (c) 2019 Lucas Brandão Pereira. All rights reserved.


import UIKit

protocol LoginPresentationLogic {
    func present(response: Login.Validate.Response)
    func presentStatements(response: Login.ServerValidate.Response)

}

class LoginPresenter: LoginPresentationLogic {
   
    
    weak var viewController: LoginDisplayLogic?
  
    // MARK: Do something

    func present(response: Login.Validate.Response) {
        let viewModel = Login.Validate.ViewModel(isValid: response.isValid)
        viewController?.displayValidation(viewModel: viewModel)
    }
    
    func presentStatements(response: Login.ServerValidate.Response) {
        let viewModel = Login.ServerValidate.ViewModel(isAuthenticated: response.isAuthenticated, userInfo: response.userInfo)
        viewController?.displayStatements(viewModel: viewModel)
    }
    
    
    
}
