//
//  BancoApi.swift
//  TrainamentoSantander
//
//  Created by matheus.p.souza on 05/07/19.
//  Copyright © 2019 matheus.p.souza. All rights reserved.
//

import Foundation
import Alamofire

class Api {
    
    func loginRequest(userRequest: String, senhaRequest: String, completion: @escaping (Usuario) -> Void) {
        
        let endpoint = "https://bank-app-test.herokuapp.com/api/login"
        let parametros : [String:Any] = [
            "user": userRequest,
            "password": senhaRequest
        ]
        let headers: HTTPHeaders = [
            "Accept": "application/json"
        ]
        
        Alamofire.request(endpoint, method: .post, parameters: parametros, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
            
            switch response.result {
                
            case .success:
                
                let decoder = JSONDecoder()
                let model = try! decoder.decode(UsuarioResponse.self, from: response.data!)
                completion(model.userAccount)
                
            case .failure:
                break
            }
        }
    }
    
    func statementsRequest(userID: Int, completion: @escaping ([StatementList]) -> Void) {
        
        let endpoint = "https://bank-app-test.herokuapp.com/api/statements/\(userID)"
        let headers: HTTPHeaders = [
            "Accept": "application/json"
        ]
        
        Alamofire.request(endpoint, method: .get, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
            
            switch response.result {
                
            case .success:
                
                let decoder = JSONDecoder()
                let model = try! decoder.decode(StatementListResponse.self, from: response.data!)
                completion(model.statementList)
                
            case .failure:
                break
                
            }
        }
    }
}
