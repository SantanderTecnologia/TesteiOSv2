//
//  UserAPIMock.swift
//  BankInterviewAppTests
//
//  Created by Osias Carneiro on 11/03/20.
//  Copyright © 2020 Osias Carneiro. All rights reserved.
//

import Foundation

class UserAPIMock: UserStoreProtocol {
    
    let user = "teste@oi.com"
    let password = "12qQ@"
    
    func doLogin(user: String, password: String, completionHandler: @escaping (LoginResponse) -> ()) {
        if(user == self.user && password == self.password) {
            completionHandler(LoginResponse(userAccount: User(userId: 1, name: "Joao dos testes", bankAccount: "100", agency: "100022", balance: 0.5), error: Error()))
        } else {
            completionHandler(LoginResponse(userAccount: User(), error: Error(code: 500, message: "Usuário ou senha inválidos")))
        }
    }
    
}
