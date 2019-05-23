//
//  StatementRequest.swift
//  BankApp
//
//  Created by Pedro Veloso on 20/05/19.
//  Copyright © 2019 pedrofveloso. All rights reserved.
//

import Foundation
import Alamofire

struct StatementRequest {
    private var id: Int
    init(id: Int) {
        self.id = id
    }
}

extension StatementRequest: Requestable {
    var url: String {
        return "https://bank-app-test.herokuapp.com/api/statements/\(id)"
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var parameters: [String : Any] {
        return [:]
    }
    
    var headers: [String : String] {
        return [:]
    }
    
    var encoding: ParameterEncoding {
        return URLEncoding.queryString
    }
    
    
}
