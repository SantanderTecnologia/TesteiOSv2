//
//  UserLoginTarget.swift
//  TesteiOSv2
//
//  Created by Felipe Rodrigues Silva on 15/01/19.
//  Copyright © 2019 Felipe Rodrigues Silva. All rights reserved.
//

import Foundation
import Alamofire

enum UserLoginTarget{
    case login(login: String, password: String)
}
extension UserLoginTarget{
    var Url: URL {
        switch self {
        case .login:
            return APISettings.composeURL(with: self.path)
        }
    }
    
    var path: String {
        switch self {
        case .login:
            return API_URL_LOGIN
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .login:
            return .post
        }
    }
    
    var parameters : Parameters {
        switch self {
        case .login(let login, let password):
            return ["user":login, "password":password]
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    
}
