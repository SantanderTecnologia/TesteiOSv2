//
//  KeychainManager.swift
//  TesteiOSv2Acc
//
//  Created by Marlon Santos Heitor on 25/05/19.
//  Copyright © 2019 Marlon Santos Heitor. All rights reserved.
//

import KeychainAccess

enum KeychainServices: String{
    case userSafeStore = "UserSafeStore"
}

enum KeychainValueKeys: String{
    case user = "user"
}

class KeychainManager {

    private var keychain: Keychain?
    
    required init(service: KeychainServices){
        keychain = Keychain(service: service.rawValue)
    }
    
    func save(value: String, key: KeychainValueKeys){
        keychain?[key.rawValue] = value
    }
    
    func retrieveString(key: KeychainValueKeys) -> String?{
        return keychain?[key.rawValue]
    }
    
    func clear(key: KeychainValueKeys){
        keychain?[key.rawValue] = nil
    }
    
}
