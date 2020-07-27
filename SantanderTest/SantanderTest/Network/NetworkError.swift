//
//  NetworkError.swift
//  SantanderTest
//
//  Created by Maria Eugênia Pereira Teixeira on 24/07/20.
//  Copyright © 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case badUrl
    case serverError
    case parserError
    case routeNotFound
    case emptyData
    case unauthorized
    case custom(String)
    case unknown
}

extension NetworkError: LocalizedError {
    
    var errorDescription: String? {
        switch self {
        case .badUrl:
            return "Malformed URL"
        case .serverError:
            return "Server failure"
        case .parserError:
            return "Parse response object failure"
        case .routeNotFound:
            return "Route not found"
        case .emptyData:
            return "Data not found"
        case .unauthorized:
            return "You need to login first"
        case .custom(let msg):
            return msg
        case .unknown:
            return "Unknown Error"
        }
    }
}
