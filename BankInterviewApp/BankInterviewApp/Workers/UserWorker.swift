//
//  UserWorker.swift
//  BankInterviewApp
//
//  Created by Osias Carneiro on 10/03/20.
//  Copyright © 2020 Osias Carneiro. All rights reserved.
//

class UserWorker {
    
    var userStore: UserStoreProtocol
    var localUserStore: LocalUserStore
    
    init(store: UserStoreProtocol, localStore: LocalUserStore) {
        self.userStore = store
        self.localUserStore = localStore
    }
    
    func doLogin(user: String, password: String, completion: @escaping (LoginResponse) -> ()) {
        userStore.doLogin(user: user, password: password, completionHandler: completion)
    }
    
    func getUser() -> String? {
        return localUserStore.fetchUser()
    }
    
    func storeUsername(user: String) {
        localUserStore.storeUser(user: user)
    }
    
}

protocol UserStoreProtocol {
    
    func doLogin(user: String, password: String, completionHandler: @escaping (LoginResponse) -> ())
    
}

protocol LocalUserStore {
    
    func fetchUser() -> String?
    func storeUser(user: String)
    
}
