//
//  KeychainProtocol.swift
//  Keychain
//
//  Created by Estaife Lima on 07/06/20.
//  Copyright © 2020 Estaife Lima. All rights reserved.
//

import Foundation

public typealias Query = [String: Any]
public protocol KeychainProtocol {
    
    @discardableResult func save(password: String, key: String) -> Bool
    @discardableResult func retrieve(key: String) -> String?
    @discardableResult func delete(key: String) -> Bool
}
