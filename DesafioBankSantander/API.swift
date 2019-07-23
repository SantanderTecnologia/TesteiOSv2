//
//  API.swift
//  DesafioBankSantander
//
//  Created by fabiana.c.almeida on 7/14/19.
//  Copyright © 2019 b. All rights reserved.
//

import Foundation
import Alamofire


protocol LoginApi {
    func login(user: String, password: String, completion:@escaping (Client) -> Void)

}

class API: LoginApi {
    // Request na API para retorno do usuario
    func login(user: String, password: String, completion: @escaping (Client) -> Void) {
        let endpoint = "https://bank-app-test.herokuapp.com/api/login"
        let params: Parameters = [
            "user": "test_user",
            "password": "Test@1"]
        
        AF.request(endpoint, method: .post, parameters: params).responseData { response in
            
            let decoder = JSONDecoder()
            let model = try!
                decoder.decode(UserResponse.self, from: response.data!)
            completion(model.client)
        }
    }
    
    // Request na API para retorno do extrato
    func requestLaunch(userId: Int, completion: @escaping
        ([Moves])-> Void) {
        let endpoint = "https://bank-app-test.herokuapp.com/api/statements/\(userId)"
        
        
        AF.request(endpoint, method: .get).responseData { response in
            
            let decoder = JSONDecoder()
            let model = try!
                decoder.decode(statementList.self, from: response.data!)
            completion(model.moves)
        }
    }
}
