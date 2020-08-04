//
//  LoginWorkerLogicMock.swift
//  Teste_iOS_v2Tests
//
//  Created by Lucas Fernandes Araujo on 04/08/20.
//  Copyright © 2020 Lucas Fernandes Araujo. All rights reserved.
//

import Foundation
@testable import Teste_iOS_v2

class LoginWorkerLogicMock: LoginWorkerLogic {
    var makeLoginCalled = false
    var saveUserLocallyCalled = false
    var retrieveLastLoggedUserCalled = false
    
    func makeLogin(model: LoginModels.Request) {
        makeLoginCalled = true
    }
    
    func saveUserLocally(_ user: String) {
        saveUserLocallyCalled = true
    }
    
    func retrieveLastLoggedUser(completion: (Any?) -> Void) {
        retrieveLastLoggedUserCalled = true
    }
    
    func clearAllBooleans() {
        makeLoginCalled = false
        saveUserLocallyCalled = false
        retrieveLastLoggedUserCalled = false
    }
    
    
}
