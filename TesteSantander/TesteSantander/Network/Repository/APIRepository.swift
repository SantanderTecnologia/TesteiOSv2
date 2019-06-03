//
//  APIRepository.swift
//  TesteSantander
//
//  Created by Felipe Alexander Silva Melo on 29/05/19.
//  Copyright © 2019 Felipe Alexander Silva Melo. All rights reserved.
//

import Foundation
import RxSwift
import Moya

protocol APIRepository {
    func login(user: String, password: String) -> Single<User>
    func fetchStatements(userId: Int) -> Single<UserStatements>
}

struct APIError: Codable, LocalizedError {
    let code: Int?
    let message: String?
    
    init(code: Int?, message: String? = Constants.Errors.APIError) {
        self.code = code
        self.message = message
    }
    
    var errorDescription: String? {
        return message
    }
}
