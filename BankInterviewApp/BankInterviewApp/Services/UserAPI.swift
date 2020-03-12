//
//  UserAPI.swift
//  BankInterviewApp
//
//  Created by Osias Carneiro on 10/03/20.
//  Copyright © 2020 Osias Carneiro. All rights reserved.
//

import Foundation
import Alamofire


class UserAPI: UserStoreProtocol {
    
    func doLogin(user: String, password: String, completionHandler: @escaping (LoginResponse) -> ()) {
        let path = Endpoints.Login.doLogin.url
        Alamofire.request(path, method: .post, parameters: ["user":user,"password":password], encoding: JSONEncoding.default).responseData(completionHandler: { response in
            if let value = response.result.value {
                let response = try! JSONDecoder().decode(LoginResponse.self, from: value)
                completionHandler(response)
            }
        })
    }
    
}
