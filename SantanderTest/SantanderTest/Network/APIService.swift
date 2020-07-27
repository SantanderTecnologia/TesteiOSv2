//
//  APIService.swift
//  SantanderTest
//
//  Created by Maria Eugênia Pereira Teixeira on 24/07/20.
//  Copyright © 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import Foundation

enum APIService {
    case login(user: String, password: String)
    case statements(id: Int)
}

extension APIService: Endpoint {
    
    var path: String {
        switch self {
        case .login:
            return "/api/login"
        case .statements(let id):
            return "/api/statements/\(id)"
        }
    }
    
    var url: URL? {
        var components = URLComponents()
        components.scheme = Constants.Network.scheme
        components.host = Constants.Network.host
        components.path = path
        return components.url
    }
    
    var method: HTTPMethod {
        switch self {
        case .login:
            return .post
        case .statements:
            return .get
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .login(let user, let pwd):
            return [
                "user"     : user,
                "password" : pwd
            ]
         case .statements:
            return nil
        }
    }
    
}
