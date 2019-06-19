//
//  LoginWorker.swift
//  Santander Teste iOS
//
//  Created by Lucas Ferraciolli Assis on 12/06/19.
//  Copyright © 2019 Lucas Conte. All rights reserved.
//

import Foundation
import Alamofire

class LoginWorker {
    func fetchLogin(auth: Login.Auth, completion: @escaping (Login.Response?) -> Void) {
        let url = SantanderAPI.shared.getLoginUrl()
        Alamofire.request(url, method: .post, parameters: auth.getParameters(), encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            guard let data = response.data, let userAccount = try? JSONDecoder().decode(Login.Response.self, from: data) else {
                completion(nil)
                return
            }
            completion(userAccount)
        }
    }
}
