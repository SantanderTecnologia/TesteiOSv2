//
//  LoginAPI.swift
//  BankApp
//
//  Created by Lynneker Souza on 5/30/20.
//  Copyright © 2020 Lynneker Souza. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class LoginAPI: LoginStoreProtocol {
    func loginUser(_ user: User, completionHandler: @escaping (UserAccount?, UserStoreError?) -> Void) {
        let param = ["user": user.user, "password": user.password]
        
        Alamofire.request("https://bank-app-test.herokuapp.com/api/login", method: .post, parameters: param, encoding: JSONEncoding.default)
            .responseJSON { response in
                if let data = response.data,
                    let json = try? JSON(data: data),
                    !json["userAccount"].isEmpty,
                    let userAcJson = try? json["userAccount"].rawData() {
                    
                    let userAccount: UserAccount = self.parse(userAcJson)
                    completionHandler(userAccount, nil)
                } else {
                    completionHandler(nil, .CannotLogin(""))
                }
        }
    }
    
    private func parse<T:Decodable>(_ data: Data, as type:T.Type = T.self) -> T {
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            fatalError("Couldn't parse JSON as \(T.self):\n\(error)")
        }
    }
}
