//
//  Storage.swift
//  Bank-App-CleanSwift
//
//  Created by Adriano Rodrigues Vieira on 17/03/21.
//

import Foundation


/// Protocol for implementation of storage classes (which encapsulates operations of CoreData, UserDefaults, Realm etc)
protocol Storage {
    func persistUsername(_ username: String) -> Bool
    func fetchUsername() -> String?
    func deleteUsername() -> Bool
    
    func persistUser(_ user: User) -> Bool
    func fetchUser() -> User?
    func deleteUser() -> Bool
}
