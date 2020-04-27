//
//  UserServiceMock.swift
//  Bank
//
//  Created by Matheus Rodrigues Ribeiro on 26/04/20.
//  Copyright © 2020 Bank. All rights reserved.
//

import Foundation

class UserServiceMock: UserStoreProtocol {
    
    let user = "test_user@mail.com"
    let password = "Test@1"
    var localUser: String?
    
    func login(user: String, password: String, completionHandler: @escaping (LoginResponse) -> ()) {
        if(user == self.user && password == self.password) {
            completionHandler(LoginResponse(userAccount: User(userId: 1, name: "Matheus Rodrigues Ribeiro", bankAccount: "0001", agency: "000012", balance: 415.57), error: Error()))
        } else {
            completionHandler(LoginResponse(userAccount: User(), error: Error(message: "Usuário ou senha inválidos", code: 500)))
        }
    }
    
    func fetchUser() -> String? {
        return self.localUser
    }
    
    func storeUser(user: String) {
        self.localUser = user
    }
    
}
