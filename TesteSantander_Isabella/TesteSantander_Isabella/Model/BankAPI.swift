//
//  BankAPI.swift
//  TesteSantander_Isabella
//
//  Created by isabella.bitencourt on 23/07/19.
//  Copyright © 2019 isabella.bitencourt. All rights reserved.
//

import Foundation
import Alamofire

protocol LoginService {
    func login(user: String, password: String, completion:@escaping (User) -> Void)
}

class BankAPI: LoginService {
    
    func findBankStatementsList(userID: Int, completion: @escaping ([BankStatements])->Void){
        let endpoint = "https://bank-app-test.herokuapp.com/api/statements/\(userID)"
        AF.request(endpoint).responseData{ response in
            let decoder = JSONDecoder()
            let model = try! decoder.decode(BankStatementsResponse.self, from: response.data!)
            completion(model.bankStatements)
            
        }
    }
    
    
    func login(user: String, password: String, completion: @escaping (User) -> Void) {
        let endpoint = "https://bank-app-test.herokuapp.com/api/login"
        let params: Parameters = [
            "user": "test_user",
            "password": "Test@1"
        ]
        
        AF.request(endpoint, method: .post, parameters: params).responseData { response in
            
            let decoder = JSONDecoder()
            let model = try! decoder.decode(UserResponse.self, from: response.data!)
            completion(model.user)
        }
        
    }
    
}

