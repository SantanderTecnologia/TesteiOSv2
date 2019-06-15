//
//  LoginKeychain.swift
//  TesteiOSv2
//
//  Created by Felipe Rodrigues Silva on 15/01/19.
//  Copyright © 2019 Felipe Rodrigues Silva. All rights reserved.
//

import Foundation
import KeychainSwift

class LoginKeychain {
    
    let keychain = KeychainSwift(keyPrefix: KeychainConstans.keychainBase)
    
    func save(user: String) {
        keychain.set(user, forKey: KeychainConstans.username)
    }
    
    func save(password: String) {
        keychain.set(password, forKey: KeychainConstans.password)
    }
    
    func getUsername() -> String? {
        return keychain.get(KeychainConstans.username)
    }
    
    func getPassword() -> String? {
        return keychain.get(KeychainConstans.password)
    }
}
