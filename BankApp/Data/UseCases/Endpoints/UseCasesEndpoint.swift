//
//  UseCasesEndpoint.swift
//  Data
//
//  Created by Estaife Lima on 06/06/20.
//  Copyright © 2020 Estaife Lima. All rights reserved.
//

import Foundation

public enum UseCasesEndpoint {
    case login
    case transactions
    
    public var url: URL? {
        switch self {
        case .login: return URL(string: Environment.baseURL + "login")
        case .transactions: return URL(string: Environment.baseURL + "statements/")
        }
    }
}
