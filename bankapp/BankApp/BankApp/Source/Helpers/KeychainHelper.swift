//
//  KeychainHelper.swift
//  BankApp
//
//  Created by Pedro Veloso on 20/05/19.
//  Copyright © 2019 pedrofveloso. All rights reserved.
//

import Foundation
import KeychainAccess

struct KeychainHelperKeys {
    static let user = "kc+user"
    static let password = "kc+password"
}

class KeychainHelper {
    static var shared = KeychainHelper()
    
    private var keychain: Keychain
    
    private init() {
        self.keychain = Keychain()
    }
    
    func set(string: String, forKey key: String) {
        do {
            try keychain.set(string, key: key)
        }
        catch {
            print(error)
        }
    }
    
    func get(key: String) -> String? {
        do {
            return try keychain.get(key)
        } catch {
            print(error)
            return nil
        }
    }
    
    func clear() {
        do {
            try keychain.removeAll()
        } catch {
            print(error)
        }
    }
}
