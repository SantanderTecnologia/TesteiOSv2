//
//  SessionWorker.swift
//  BankTest
//
//  Created by Luan Nascimento Almeida on 04/03/20.
//  Copyright © 2020 bank. All rights reserved.
//

import Foundation
import KeychainSwift

protocol SessionWorkerLogic {

    var keychain: KeychainSwift? { get }

    func save(session: Login.Request)
    func session() -> Login.Request?
}

class SessionWorker: SessionWorkerLogic {

    var keychain: KeychainSwift?

    init() {
        keychain = KeychainSwift()
    }

    func save(session: Login.Request) {
        guard let user = session.user, let password = session.password else {
            return
        }
        keychain?.set(user, forKey: "user")
        keychain?.set(password, forKey: "password")
    }

    func session() -> Login.Request? {
        guard let user = keychain?.get("user"), let password = keychain?.get("password") else {
            return nil
        }
        return Login.Request(user: user, password: password)
    }
}
