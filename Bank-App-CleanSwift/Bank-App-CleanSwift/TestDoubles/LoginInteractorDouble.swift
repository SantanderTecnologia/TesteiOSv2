//
//  LoginInteractorDouble.swift
//  Bank-App-CleanSwift
//
//  Created by Adriano Rodrigues Vieira on 16/03/21.
//

import Foundation

/// Login interactor spy, for testing purposes.
class LoginInteractorDouble: LoginBusinessLogic {
    var applyBusinessLogicWasCalled: Bool = false
    var validateFieldsWasCalled: Bool = false
    var fetchLastLoggedUsernameWasCalled: Bool = false
    
    func fetchLastLoggedUsername(request: Login.FetchLastLoggedUser.Request) {
        fetchLastLoggedUsernameWasCalled = true        
    }
    
    
    func doTryLogin(request: Login.Login.Request) {
        applyBusinessLogicWasCalled = true
        let _ = validateFields(of: User(username: request.fields.username, password: request.fields.password))        
    }
    
    private func validateFields(of user: User) -> Bool {
        validateFieldsWasCalled = true
        return true
    }
    
}
