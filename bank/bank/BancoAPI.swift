//
//  BancoAPI.swift
//  bank
//
//  Created by mayara.da.s.andrade on 10/07/19.
//  Copyright © 2019 mayara.da.s.andrade. All rights reserved.
//

import Foundation
import Alamofire

protocol LoginService {
    func login(user: String, password: String, completion:@escaping (Usuario) -> Void)
    
}
class BancoAPI: LoginService {
    
    func login(user: String, password: String, completion: @escaping (Usuario) -> Void) {
        let endpoint = "https://bank-app-test.herokuapp.com/api/login"
        let params: Parameters = [
            "user": "test_user",
            "password": "Test@1"
        ]
        
        AF.request(endpoint, method: .post, parameters: params).responseData { response in
            
            let decoder = JSONDecoder()
            let model = try! decoder.decode(UsuarioResponse.self, from: response.data!)
            completion(model.usuario)
        }
    }
        
        func  status(userId:Int, completion: @escaping ([Status]) -> Void){
            let endpoint = "https://bank-app-test.herokuapp.com/api/statements/\(userId)"
            
            AF.request(endpoint, method: .get).responseData.self{ response in
                
                let decoder = JSONDecoder()
                let model = try! decoder.decode(StatusResponse.self, from: response.data!)
                completion(model.status)
            }
        }
}
    


