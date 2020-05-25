//
//  KeychainUtils.swift
//  Bank app
//
//  Created by mmalaqui on 19/05/2020.
//  Copyright © 2020 everis. All rights reserved.
//

import Foundation
import KeychainSwift

class KeychainUtils {
    fileprivate let usernameKey = "USERNAME"
    fileprivate let passwordKey = "PASSWORD"

    static var shared = KeychainUtils()
    
    fileprivate let keychain = KeychainSwift()
    
    private init(){
        
    }
    
    func getUsername() -> String? {
        return keychain.get(usernameKey)
    }
    
    func getPassword() -> String? {
        return keychain.get(passwordKey)
    }
    
    func saveUsername(username: String) -> Bool{
        return keychain.set(username, forKey: usernameKey, withAccess: .accessibleWhenUnlockedThisDeviceOnly)
    }
    
    func savePassword(password: String) -> Bool{
        return keychain.set(password, forKey: passwordKey, withAccess: .accessibleWhenUnlockedThisDeviceOnly)
    }
    
    func deleteUsername(){
        keychain.delete(usernameKey)
    }
    func deletePassword(){
        keychain.delete(passwordKey)
    }
}
