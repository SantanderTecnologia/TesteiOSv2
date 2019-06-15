//
//  KeyChainConstants.swift
//  TesteiOSv2
//
//  Created by Felipe Rodrigues Silva on 15/01/19.
//  Copyright © 2019 Felipe Rodrigues Silva. All rights reserved.
//

import Foundation

///Keychain Contantes values
struct KeychainConstans {
    static let keychainBase: String = "com.br.TesteiOSv2.Login"
    static let username: String = "\(keychainBase).usename"
    static let password: String = "\(keychainBase).password"
}
