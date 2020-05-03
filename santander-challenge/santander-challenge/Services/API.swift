//
//  API.swift
//  santander-challenge
//
//  Created by Kevin Oliveira on 02/05/20.
//  Copyright © 2020 Kevin Oliveira. All rights reserved.
//

import Foundation

class API {

    enum Endpoints {
        case login
        case listStatements
    }

    static let baseUrl = "https://bank-app-test.herokuapp.com/api"
    static let defaultHeaders = ["content-type": "application/json"]

    static func getURL(_ endpoint: Endpoints, _ parameters: [String:Any]? = nil) -> String? {
        switch endpoint {
        case .login:
            return "\(API.baseUrl)/login"

        case .listStatements:
            guard let userId = parameters?["userId"] else { return nil }
            return "\(API.baseUrl)/statements/\(userId)"
        }
    }
}
