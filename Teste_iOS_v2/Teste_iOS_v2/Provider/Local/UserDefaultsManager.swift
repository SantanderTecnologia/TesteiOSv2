//
//  UserDefaultsManager.swift
//  Teste_iOS_v2
//
//  Created by Lucas Fernandes Araujo on 03/08/20.
//  Copyright © 2020 Lucas Fernandes Araujo. All rights reserved.
//

import Foundation

class UserDefaultsManager {
    class func set(_ value: Any, forKey key: String) {
        UserDefaults.standard.set(value, forKey: key)
    }
    
    class func retrieve(withObjectKey key: String) -> Any? {
        return UserDefaults.standard.object(forKey: key)
    }
}
