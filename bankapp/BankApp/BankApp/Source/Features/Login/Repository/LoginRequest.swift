//
//  LoginRequest.swift
//  BankApp
//
//  Created by Pedro Veloso on 20/05/19.
//  Copyright © 2019 pedrofveloso. All rights reserved.
//

import Foundation
import Alamofire


struct LoginRequest {
    private let params: [String: String]
    
    init(params: [String: String]) {
        self.params = params
    }
}

extension LoginRequest: Requestable {
    var url: String {
        return "https://bank-app-test.herokuapp.com/api/login"
    }
    
    var method: HTTPMethod {
        return .post
    }
    
    var parameters: [String : Any] {
        return params
    }
    
    var headers: [String : String] {
        return [:]
    }
    
    var encoding: ParameterEncoding {
        return JSONEncoding.default
    }
}
