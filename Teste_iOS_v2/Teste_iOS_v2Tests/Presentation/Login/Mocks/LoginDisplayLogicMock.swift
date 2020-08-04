//
//  LoginDisplayLogicMock.swift
//  Teste_iOS_v2Tests
//
//  Created by Lucas Fernandes Araujo on 04/08/20.
//  Copyright © 2020 Lucas Fernandes Araujo. All rights reserved.
//

import UIKit
@testable import Teste_iOS_v2

class LoginDisplayLogicMock: LoginDisplayLogic {
    var displaySuccessLoginCalled = false
    var displayErrorLoginCalled = false
    var displayLastLoggedUser = false
    
    func displaySuccessLogin(model: LoginModels.Response) {
        displaySuccessLoginCalled = true
    }
    
    func displayErrorLogin(_ error: UIViewController) {
        displayErrorLoginCalled = true
    }
    
    func displayLastLoggedUser(_ user: String) {
        displayLastLoggedUser = true
    }
    
    func clearAllBooleans() {
        displaySuccessLoginCalled = false
        displayErrorLoginCalled = false
        displayLastLoggedUser = false
    }
    

}
