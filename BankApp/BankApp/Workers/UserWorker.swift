//
//  UserWorker.swift
//  BankApp
//
//  Created by Visão Grupo on 7/20/19.
//  Copyright © 2019 Vinicius Teixeira. All rights reserved.
//

import Foundation

class UserWorker {

    var userStore: UserStoreProtocol

    init(_ userStore: UserStoreProtocol) {
        self.userStore = userStore
    }
    
    func login(_ login: String, password: String, completionHandler: @escaping (User?) -> Void) {
        userStore.login(login, password: password, completionHandler: completionHandler)
    }
    
    func createUser(_ user: User, completionHandler: @escaping (User?, UserStoreError?) -> Void) {
        userStore.createUser(user, completionHandler: completionHandler)
    }
    
    func fetchUser(completionHandler: @escaping (User?, UserStoreError?) -> Void) {
        userStore.fetchUser(completionHandler: completionHandler)
    }
}

protocol UserStoreProtocol {
    func login(_ login: String, password: String, completionHandler: @escaping (User?) -> Void)
    func createUser(_ user: User, completionHandler: @escaping (User?, UserStoreError?) -> Void)
    func fetchUser(completionHandler: @escaping (User?, UserStoreError?) -> Void)
}


enum UserStoreError: Equatable, Error {
    case CannotFetch(String)
    case CannotCreate(String)
    case CannotUpdate(String)
    case CannotDelete(String)
}
