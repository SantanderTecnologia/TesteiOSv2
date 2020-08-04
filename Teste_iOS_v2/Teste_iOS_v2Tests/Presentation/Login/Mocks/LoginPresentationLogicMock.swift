//
//  LoginPresentationLogicMock.swift
//  Teste_iOS_v2Tests
//
//  Created by Lucas Fernandes Araujo on 04/08/20.
//  Copyright © 2020 Lucas Fernandes Araujo. All rights reserved.
//

import UIKit
@testable import Teste_iOS_v2

class LoginPresentationLogicMock: LoginPresentationLogic {
    var presentSuccessLoginCalled = false
    var presentUncompletedFieldsErrorCalled = false
    var presentWrongFieldsErrorCalled = false
    var presentAuthenticationErrorCalled = false
    var presentLastLoggedUserCalled = false
    
    func presentSuccessLogin(model: LoginModels.Response) {
        presentSuccessLoginCalled = true
    }
    
    func presentUncompletedFieldsError() {
        presentUncompletedFieldsErrorCalled = true
    }
    
    func presentWrongFieldsError() {
        presentWrongFieldsErrorCalled = true
    }
    
    func presentAuthenticationError() {
        presentAuthenticationErrorCalled = true
    }
    
    func presentLastLoggedUser(_ user: String) {
        presentLastLoggedUserCalled = true
    }
    
    func clearAllBooleans() {
        presentSuccessLoginCalled = false
        presentUncompletedFieldsErrorCalled = false
        presentWrongFieldsErrorCalled = false
        presentAuthenticationErrorCalled = false
        presentLastLoggedUserCalled = false
    }
    
    
}

