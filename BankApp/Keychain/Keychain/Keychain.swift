//
//  Keychain.swift
//  Keychain
//
//  Created by Estaife Lima on 07/06/20.
//  Copyright © 2020 Estaife Lima. All rights reserved.
//

import Foundation

public struct Keychain {
    
    private let userDefaults: UserDefaults
    private let keyLastKeySaved = "keyLastKeySaved"
    
    public init(userDefaults: UserDefaults = UserDefaults()) {
        self.userDefaults = userDefaults
    }
    
    private func saveKeyInUserDefauls(key: String) {
        userDefaults.set(key, forKey: keyLastKeySaved)
    }
    
    private func removeLastKey() {
        userDefaults.set(nil, forKey: keyLastKeySaved)
    }
    
    @discardableResult
    public func lastKey() -> String? {
        userDefaults.string(forKey: keyLastKeySaved)
    }
    
    private func saveInKeychain(query: Query) -> Bool {
        let result = SecItemAdd(query as CFDictionary, nil)
        let msg = SecCopyErrorMessageString(result, nil)
        debugPrint("ErrorMessageString: in func: \(#function) \(String(describing: msg))")
        return result == errSecSuccess
    }
    
    private func findKeyInKeychain(query: Query) -> String? {
        var item: CFTypeRef?
        let result = SecItemCopyMatching(query as CFDictionary, &item)
        guard result == errSecSuccess else { return nil }
        let msg = SecCopyErrorMessageString(result, nil)
        debugPrint("ErrorMessageString: in func: \(#function) \(String(describing: msg))")
        
        guard let keyData = item as? Data, let key = String(data: keyData, encoding: .utf8) else { return nil }
        return key
    }
    
    private func removeFromKeychain(query: Query) -> Bool {
        let result = SecItemDelete(query as CFDictionary)
        let msg = SecCopyErrorMessageString(result, nil)
        debugPrint("ErrorMessageString: in func: \(#function) \(String(describing: msg))")
        return result == errSecSuccess
    }
}

extension Keychain: KeychainProtocol {
    
    @discardableResult
    public func save(password: String, key: String) -> Bool {
        if let lastKey = lastKey() {
            self.delete(key: lastKey)
        }
        
        guard let passwordData = password.data(using: .utf8) else { return false }
        let query: Query = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecValueData as String: passwordData
        ]
        let isSaveKey = saveInKeychain(query: query)
        if isSaveKey {
            saveKeyInUserDefauls(key: key)
        }
        return isSaveKey
    }
    
    @discardableResult
    public func retrieve(key: String) -> String? {
        let query: Query = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecReturnData as String: true
            
        ]
        return findKeyInKeychain(query: query)
    }
    
    @discardableResult
    public func delete(key: String) -> Bool {
        let query: Query = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key
        ]
        let isDeleted = removeFromKeychain(query: query)
        if isDeleted {
            removeLastKey()
        }
        return isDeleted
    }
}
