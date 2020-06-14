//
//  SecureAPI.swift
//  TesteiOSv2
//
//  Created by Foliveira on 06/06/20.
//  Copyright © 2020 Foliveira. All rights reserved.
//

import Foundation
import SwiftKeychainWrapper

enum LoginKeys: String {
    case userName = "user"
    case password = "password"
}

class SecureAPI {
    
    
    static func login(user: UserAuthModel){
        KeychainWrapper.standard.set(user.name, forKey: LoginKeys.userName.rawValue)
        KeychainWrapper.standard.set(user.password, forKey: LoginKeys.password.rawValue)
        print("Login salvo")
    }
    
    static func recoverUser(data: @escaping ((UserAuthModel)?) -> Void) {
        if let user = KeychainWrapper.standard.string(forKey: LoginKeys.userName.rawValue),
            let password = KeychainWrapper.standard.string(forKey: LoginKeys.password.rawValue){
            return data(UserAuthModel(name: user, password: password))
        }
        return data(nil)
    }
    
    static func recoverCPF() -> String {
        if let user = KeychainWrapper.standard.string(forKey: LoginKeys.userName.rawValue) {
            return user
        }
        return ""
    }
    
    static func logout() {
        KeychainWrapper.standard.removeObject(forKey: LoginKeys.password.rawValue)
    }
    static func removeUser() {
        KeychainWrapper.standard.removeObject(forKey: LoginKeys.userName.rawValue)
    }
}

