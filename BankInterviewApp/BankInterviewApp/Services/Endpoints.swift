//
//  Endpoints.swift
//  BankInterviewApp
//
//  Created by Osias Carneiro on 10/03/20.
//  Copyright © 2020 Osias Carneiro. All rights reserved.
//

struct API {
    static let baseUrl = "https://bank-app-test.herokuapp.com/api"
}

protocol Endpoint {
    var path: String { get }
    var url: String { get }
}

extension Endpoint {
    var url: String {
        get {
            return "\(API.baseUrl)/\(path)"
        }
    }
}

enum Endpoints {
    
    enum Login: Endpoint {
        case doLogin
        
        var path: String {
            switch self {
            case .doLogin:
                return "login"
            }
        }
    }
    
    enum Statements: Endpoint {
        case getStatements(Int)
        
        var path: String {
            switch self {
            case .getStatements(let userId):
                return "statements/\(userId)"
            }
        }
    }
    
}
