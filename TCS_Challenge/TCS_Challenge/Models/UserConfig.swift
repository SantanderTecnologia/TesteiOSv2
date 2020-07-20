//
//  UserConfig.swift
//  TCS_Challenge
//
//  Created by Rafael Valer on 15/07/20.
//  Copyright © 2020 Rafael Valer. All rights reserved.
//

import Foundation

enum UserDefaultsKeys: String {
    case loginUser = "login_user"
}

// MARK: User Configurations
/// Caches basic information to User Defaults
class UserConfig {
     
    static let shared = UserConfig()
    private var userDefaults: UserDefaults
    
    private init() {
        userDefaults = UserDefaults.standard
    }
    
    // user email or CPF used to login
    var loginUser: String? {
        get {
            return userDefaults.value(forKey: UserDefaultsKeys.loginUser.rawValue) as? String
        }
        set {
            userDefaults.setValue(newValue, forKey: UserDefaultsKeys.loginUser.rawValue)
            userDefaults.synchronize()
        }
    }
}
