//
//  UserService.swift
//  Bank
//
//  Created by Matheus Rodrigues Ribeiro on 25/04/20.
//  Copyright © 2020 Bank. All rights reserved.
//

import Foundation
import Alamofire

class UserService: UserStoreProtocol {
    
    static let userKey = "KEY_USERNAME"
    
    func login(user:String, password: String, completionHandler: @escaping (LoginResponse) -> ()) {
        if let path = API.getURL(.login) {
            Alamofire.request(path, method: .post, parameters: ["user":user,"password":password], encoding: JSONEncoding.default).responseData(completionHandler: { response in
                if let value = response.result.value {
                    let response = try! JSONDecoder().decode(LoginResponse.self, from: value)
                    completionHandler(response)
                }
            })
        }
    }
    
    func fetchUser() -> String? {
        return KeychainWrapper.standard.string(forKey: UserService.userKey)
    }
    
    func storeUser(user: String) {
        KeychainWrapper.standard.set(user, forKey: UserService.userKey)
    }

}
