//
//  API.swift
//  Bank
//
//  Created by Matheus Rodrigues Ribeiro on 26/04/20.
//  Copyright © 2020 Bank. All rights reserved.
//

import Foundation

class API {
    
    enum EndPoint {
        case login
        case statements
    }
    
    static let baseUrl = "https://bank-app-test.herokuapp.com/api"
    
    static func getURL(_ endPoint:EndPoint, _ parameters:[String:Any]? = nil) -> String? {
        switch endPoint {
        case .login:
            return "\(API.baseUrl)/login"
        case .statements:
            if let id = parameters?["id"] as? NSNumber {
                return "\(API.baseUrl)/statements/\(id.intValue)"
            }
            return nil
        }
    }
}
