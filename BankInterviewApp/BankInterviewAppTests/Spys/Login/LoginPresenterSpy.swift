//
//  LoginPresenterSpy.swift
//  BankInterviewAppTests
//
//  Created by Osias Carneiro on 11/03/20.
//  Copyright © 2020 Osias Carneiro. All rights reserved.
//

import Foundation

class LoginPresenterSpy: LoginPresentationLogic {
    
    var sucess: Login.Response?
    var error: Login.Error?
    
    func loginSucess(response: Login.Response) {
        self.sucess = response
    }
    
    func error(error: Login.Error) {
        self.error = error
    }
    
}
