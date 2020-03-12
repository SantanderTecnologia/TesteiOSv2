//
//  LoginDisplayLogicSpy.swift
//  BankInterviewAppTests
//
//  Created by Osias Carneiro on 11/03/20.
//  Copyright © 2020 Osias Carneiro. All rights reserved.
//

import Foundation

class LoginDisplayLogicSpy: LoginDisplayLogic {
    
    var loginError: Login.Error?
    var sucess: Login.ViewModel?
    
    func loginError(error: Login.Error) {
        loginError = error
    }
    
    func loginSucess(user: Login.ViewModel) {
        sucess = user
    }
    
}
