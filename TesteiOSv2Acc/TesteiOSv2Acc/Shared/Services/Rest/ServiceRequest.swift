//
//  ServiceRequest.swift
//  TesteiOSv2Acc
//
//  Created by Marlon Santos Heitor on 25/05/19.
//  Copyright © 2019 Marlon Santos Heitor. All rights reserved.
//

import Alamofire

struct ServiceRequest{
    
    let url: String
    let method: HTTPMethod
    let parameters: [String: Any]?
    let headers: [String:String]
    
    static func requestForLogin(user: String, password: String) -> ServiceRequest{
        
        let url = "https://bank-app-test.herokuapp.com/api/login"
        let parameters: [String: Any] = ["user": user, "password": password]
        let headers: [String:String] = ["Content-Type": "application/x-www-form-urlencoded"]
        
        let serviceRequest = ServiceRequest(url: url, method: .post, parameters: parameters, headers: headers)
        
        return serviceRequest
    }
    
    static func requestForStatements(userId: Int) -> ServiceRequest{
        
        let url = "https://bank-app-test.herokuapp.com/api/statements/\(userId)"
        let headers: [String:String] = ["Content-Type": "application/x-www-form-urlencoded"]
        
        let serviceRequest = ServiceRequest(url: url, method: .get, parameters: nil, headers: headers)
        
        return serviceRequest
    }
    
}
