//
//  LoginProvider.swift
//  SANTANDER
//
//  Created by Maíra Preto on 25/02/20.
//  Copyright © 2020 Maíra Acioli. All rights reserved.
//

import Foundation
import Alamofire


protocol UserProviderDelegate: class {
    
    func successLoadUsers(users: Account)
    func errorLoadUsers(error: Error?)
}

class LoginProvider {
    
    weak var delegate: UserProviderDelegate?
    
    func loadUsers() {
        
        let parameters: Parameters = ["user": "test_user", "password" : "Test@1"]
        let urlString = API.baseURL + API.login
        
        if let url:URL = URL(string: urlString) {
            
            Alamofire.request(url, method: .post, parameters: parameters).responseJSON { (response) in
                
                if response.response?.statusCode == 200 {
                    
                    do {
                        
                        let model:Account = try JSONDecoder().decode(Account.self, from:  response.data ?? Data())
                        
                        print(model)
                        self.delegate?.successLoadUsers(users: model)
                        
                    } catch  let error{
                        print( error)
                        self.delegate?.errorLoadUsers(error: error as? Error)
                    }
                }else {
                    print("=========error")
                    print(response.error ?? "")
                    self.delegate?.errorLoadUsers(error: response.error as? Error)
                }
            }
            
        }
        
    }
    
}


