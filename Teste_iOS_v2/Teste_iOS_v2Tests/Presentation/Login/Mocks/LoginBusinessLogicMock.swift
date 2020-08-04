//
//  LoginBusinessLogicMock.swift
//  Teste_iOS_v2Tests
//
//  Created by Lucas Fernandes Araujo on 04/08/20.
//  Copyright © 2020 Lucas Fernandes Araujo. All rights reserved.
//

import Foundation
@testable import Teste_iOS_v2

class LoginBusinessLogicMock: LoginBusinessLogic {
    var retrieveLastLoggedUserCalled = false
    var validateLoginCalled = false
    
    func retrieveLastLoggedUser() {
        retrieveLastLoggedUserCalled = true
    }
    
    func validateLogin(username: String?, password: String?) {
        validateLoginCalled = true
    }
    
    func clearAllBooleans() {
        retrieveLastLoggedUserCalled = false
        validateLoginCalled = false
    }
}
