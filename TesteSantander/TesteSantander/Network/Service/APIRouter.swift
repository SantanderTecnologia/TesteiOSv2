//
//  APIRouter.swift
//  TesteSantander
//
//  Created by Felipe Alexander Silva Melo on 29/05/19.
//  Copyright © 2019 Felipe Alexander Silva Melo. All rights reserved.
//

import Moya

enum APIRouter {
    case login(String, String)
    case fetchStatements(Int)
}

extension APIRouter: TargetType {
    var baseURL: URL {
        guard let url = URL(string: Constants.Networking.baseURL) else {
            fatalError(Constants.Errors.loadURL)
        }
        return url
    }
    
    var path: String {
        switch self {
        case .login:
            return "/login"
        case .fetchStatements(let userId):
            return "/statements/\(userId)"
        }
    }
    
    var method: Method {
        switch self {
        case .login:
            return .post
        case .fetchStatements:
            return .get
        }
    }
    
    var sampleData: Data {
        guard let data = Data(base64Encoded: "") else {
            fatalError(Constants.Errors.encodeData)
        }
        return data
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .login(let user, let password):
            return [
                "user": user,
                "password": password
            ]
        case .fetchStatements:
            return nil
        }
    }
    
    var task: Task {
        if let `parameters` = parameters {
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
        } else {
            return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        return [
            "Content-Type": "application/x-www-form-urlencoded"
        ]
    }
}
