//
//  API.swift
//  TesteSantander
//
//  Created by bianca.butti.almeida on 10/07/19.
//  Copyright © 2019 bianca.butti.almeida. All rights reserved.
//

import Foundation
import Alamofire

protocol LoginService {
    func login (user: String, password: String, completion:@escaping (Usuario) -> Void)
}

class API: LoginService{
    func login (user: String, password: String, completion:@escaping (Usuario) -> Void){
        let endpoint = "https://bank-app-test.herokuapp.com/api/login"
        let params: Parameters = [
            "user" : "test_user",
            "password" : "Test@1"
        ]
        AF.request(endpoint, method: .post, parameters: params).responseData{
            response in
            let decoder = JSONDecoder()
            let model = try! decoder.decode(UsuarioResponse.self, from: response.data!)
            completion(model.user)
        }
    }
}


