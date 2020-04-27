//
//  UserWorker.swift
//  Bank
//
//  Created by Matheus Rodrigues Ribeiro on 25/04/20.
//  Copyright © 2020 Bank. All rights reserved.
//

class UserWorker {
    
    var userStore: UserStoreProtocol
    
    init(store: UserStoreProtocol) {
        self.userStore = store
    }
    
    func login(user: String, password: String, completion: @escaping (LoginResponse) -> ()) {
        userStore.login(user: user, password: password, completionHandler: completion)
    }
    
    func getUser() -> String? {
        return userStore.fetchUser()
    }
    
    func storeUsername(user: String) {
        userStore.storeUser(user: user)
    }
    
}

protocol UserStoreProtocol {
    func login(user: String, password: String, completionHandler: @escaping (LoginResponse) -> ())
    func fetchUser() -> String?
    func storeUser(user: String)
}
