//
//  UserAPI.swift
//  BankApp
//
//  Created by Visão Grupo on 7/20/19.
//  Copyright © 2019 Vinicius Teixeira. All rights reserved.
//

import Alamofire

class UserAPI: UserStoreProtocol {
    
    // MARK: UserStoreProtocol
    
    func createUser(_ user: User, completionHandler: @escaping (User?, UserStoreError?) -> Void) {}
    func fetchUser(completionHandler: @escaping (User?, UserStoreError?) -> Void) {}
    
    func login(_ login: String, password: String, completionHandler: @escaping (User?) -> Void) {
        let parameters: Parameters = ["user": login,
                                      "password": password]
        Alamofire.request("https://bank-app-test.herokuapp.com/api/login", method: .post, parameters: parameters, headers: ["Content-Type":"application/x-www-form-urlencoded"]).responseJSON { response in
            do {
                if let data = response.data {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                        if let user = json["userAccount"] as? [String: Any] {
                            let userData = try JSONSerialization.data(withJSONObject: user, options: [])
                            let decoder = JSONDecoder()
                            let userAux = try decoder.decode(User.self, from: userData)
                            completionHandler(userAux)
                        }
                    }
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
