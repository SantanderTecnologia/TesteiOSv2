//
//  UserWorker.swift
//  BankApp
//
//  Created by Lynneker Souza on 5/30/20.
//  Copyright © 2020 Lynneker Souza. All rights reserved.
//

import Foundation
class UserWorker
{
    var loginStore: LoginStoreProtocol
    
    init(loginStore: LoginStoreProtocol)
    {
        self.loginStore = loginStore
    }
}

protocol LoginStoreProtocol
{
    func loginUser(_ user: User, completionHandler: @escaping (UserAccount?, UserStoreError?) -> Void)
}

// MARK: - User store CRUD operation errors

enum UserStoreError: Error
{
    case CannotLogin(String)
}
