//
//  UserDefaultsStorage.swift
//  Bank-App-CleanSwift
//
//  Created by Adriano Rodrigues Vieira on 17/03/21.
//

import Foundation

/// Class for store data in UserDefaults
class UserDefaultsStorage: Storage {
    private let storage = UserDefaults.standard
    
    
    /// Deletes the username saved in `UserDefaults`
    /// - Returns: `true` if the operation was successful; `false` otherwise
    func deleteUsername() -> Bool {
        storage.removeObject(forKey: Constants.USERNAME_KEY)
        return true
    }
    
    /// Stores an `username` string in `Userdefaults`
    /// - Parameter username: a `String` representing the `username`
    /// - Returns: `true` if the operation was successful; `false` otherwise
    func persistUsername(_ username: String) -> Bool {
        storage.set(username, forKey: Constants.USERNAME_KEY)
        return true
    }
        
    /// Gets the last `username` stored in `UserDefaults`
    /// - Returns: the `username` saved, or `nil` if no `username` were stored
    func fetchUsername() -> String? {
        return storage.string(forKey: Constants.USERNAME_KEY)
    }
    
    /// Deletes the `User` object saved in `UserDefaults`
    /// - Returns: `true` if the operation was successful; `false` otherwise
    func deleteUser() -> Bool {
        storage.removeObject(forKey: Constants.USER_KEY)
        return true
    }
        
    /// Saves an `User` object in `UserDefauts`
    /// - Parameter user: an `User` object to be stored
    /// - Returns: `true` if the operation was successful; `false` otherwise
    func persistUser(_ user: User) -> Bool {
        storage.set(try? PropertyListEncoder().encode(user), forKey: Constants.USER_KEY)
        return true
    }
    
    /// Gets the last `User` object stored in `UserDefaults`
    /// - Returns: the `User` object saved, or `nil` if no `User` object were stored
    func fetchUser() -> User? {
        let user = try? PropertyListDecoder().decode(User.self, from: storage.value(forKey: Constants.USER_KEY) as! Data)
        return user
    }
}
