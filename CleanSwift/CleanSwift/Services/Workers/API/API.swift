//
//  API.swift
//  CleanSwift
//
//  Created by Samanta Coutinho on 2019-08-06.
//  Copyright © 2019 Sam. All rights reserved.
//

import Foundation
import Alamofire

struct LoginParams: Encodable {
    let user: String
    let password: String
}

enum API: URLRequestConvertible {
    case login(username: String, password: String)
    case home(userId: String)
    
    private var method: HTTPMethod {
        switch self {
        case .login: return .post
        case .home: return .get
        }
    }
    
    private var path: String {
        switch self {
        case .login: return Constants.Service.login
        case .home(let userId): return "\(Constants.Service.home)\(userId)"
        }
    }

    func asURLRequest() throws -> URLRequest {
        let base = "https://bank-app-test.herokuapp.com/api/"

        let url = try base.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        
        urlRequest.setValue(Constants.Service.json, forHTTPHeaderField: Constants.Service.contentType)
        
        switch self {
        case .login(let username, let password):
            let params: LoginParams = LoginParams(user: username, password: password)
            urlRequest = try URLEncodedFormParameterEncoder.default.encode(params, into: urlRequest)
        case .home: break
        }

        return urlRequest
    }
}
