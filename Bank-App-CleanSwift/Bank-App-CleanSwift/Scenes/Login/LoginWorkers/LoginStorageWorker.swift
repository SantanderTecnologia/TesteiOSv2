//
//  LoginSaveLastUserWorker.swift
//  Bank-App-CleanSwift
//
//  Created by Adriano Rodrigues Vieira on 17/03/21.
//

import Foundation

class LoginStorageWorker {
    private var storage: Storage
    
    init(storage: Storage) {
        self.storage = storage
    }
        
    /// Persists an `username` in the `Store`
    /// - Parameter username: the `username` string
    /// - Returns: `true` if the process was successful; `false` otherwise
    func persistUsername(_ username: String) -> Bool {
        return storage.persistUsername(username)
    }
    
    
    /// Fetchs the last `username` saved in the `Store`
    /// - Returns: the last `username` saved, or `nil` if there is no `username` saved
    func fetchLastLoggedUsername() -> String? {
        return storage.fetchUsername()
    }
    
    /// Deletes the last `username` saved in the `Store`
    /// - Parameter username: the `username` string
    /// - Returns: `true` if the process was successful; `false` otherwise
    func deleteLastLoggedUsername() -> Bool {
        return storage.deleteUsername()
    }
    
    /// Persists an `User` object  in the `Store`
    /// - Parameter user: the `username` object
    /// - Returns: `true` if the process was successful; `false` otherwise
    func persistUser(_ user: User) -> Bool {
        return storage.persistUser(user)
    }
    
    /// Fetchs the last `user` saved in the `Store`
    /// - Returns: the last `user` saved, or `nil` if there is no `user` saved
    func fetchLastLoggedUser() -> User? {
        return storage.fetchUser()
    }
    
    /// Deletes the last `user` saved in the `Store`
    /// - Parameter user: the `username` string
    /// - Returns: `true` if the process was successful; `false` otherwise
    func deleteLastLoggedUser() -> Bool {
        return storage.deleteUser()
    }
}
