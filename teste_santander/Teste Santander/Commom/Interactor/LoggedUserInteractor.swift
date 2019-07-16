//
//  LoggedUserInteractor.swift
//  Teste Santander
//
//  Created by THIAGO on 04/07/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import Foundation
import KeychainSwift
import ObjectMapper


protocol LoggedUserInteractorInput {
    func loggedUser() -> UserItem?
    func logout()
}

@objc protocol LoggedUserInteractorOutput: class {
   @objc optional func didLogout()
}

class LoggedUserInteractor: LoggedUserInteractorInput {
    
    weak var output: LoggedUserInteractorOutput?
    
    func loggedUser() -> UserItem? {
        let keychain = KeychainSwift()
        if let modelData = keychain.getData("userData") {
            do {
                let modelJson = try! JSONSerialization.jsonObject(with: modelData, options: .allowFragments)
                guard let userModel = Mapper<UserModel>().map(JSONObject:modelJson) else { return nil }
                return UserItem.make(loginEntenty: LoginEntityMapper.create(model: userModel))
            }
        }
        return nil
    }
    
    func logout() {
       let keychain = KeychainSwift()
        keychain.delete("userData")
        keychain.clear()
        output?.didLogout?()
    }
}
