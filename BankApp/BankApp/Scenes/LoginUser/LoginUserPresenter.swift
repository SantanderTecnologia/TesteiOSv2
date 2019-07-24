//
//  LoginUserPresenter.swift
//  BankApp
//
//  Created by Visão Grupo on 7/20/19.
//  Copyright © 2019 Vinicius Teixeira. All rights reserved.
//

import Foundation

protocol LoginUserPresentationLogic {
    func presentUserLogged()
    func presentUser(_ response: LoginUser.FetchUser.Response)
}

class LoginUserPresenter: LoginUserPresentationLogic {
    
    weak var viewController: LoginUserDisplayLogic?
    
    func presentUser(_ response: LoginUser.FetchUser.Response) {
        let viewModel = LoginUser.FetchUser.ViewModel(login: response.login)
        viewController?.displayUser(viewModel)
    }
    
    func presentUserLogged() {
        viewController?.userLogged()
    }
    
}
