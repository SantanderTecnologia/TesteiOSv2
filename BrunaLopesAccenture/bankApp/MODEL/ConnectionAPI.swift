//
//  ConexaoAPI.swift
//  bankApp
//
//  Created by bruna.lopes.d.santos on 08/07/19.
//  Copyright © 2019 bruna.lopes.d.santos. All rights reserved.
//

import Foundation
import Alamofire

protocol LoginService {
    
    func doLogin(user:String, password: String, completion:@escaping (User) -> Void)

}

class ConnectionAPI: LoginService {

    func doLogin(user: String, password: String, completion: @escaping (User) -> Void) {
        
        let link = "https://bank-app-test.herokuapp.com/api/login"
        let parameters: Parameters = ["user" : "test_user",
                                      "password" : "Test@1"]
        
        AF.request(link, method: .post, parameters: parameters).responseData { response in
            
            let decoder = JSONDecoder()
            let model = try! decoder.decode(UserResponse.self, from: response.data!)
            completion(model.user)
            
        }
    }
    
    func searchExtract(userId: Int, completion: @escaping ([Extract]) -> Void) {
        
        let link = "https://bank-app-test.herokuapp.com/api/statements/\(userId)"
        
        AF.request(link, method: .get).responseData { response in
            
            let decoder = JSONDecoder()
            let model = try! decoder.decode(ExtractRec.self, from: response.data!)
            completion(model.information)
            
        }
    }
}
