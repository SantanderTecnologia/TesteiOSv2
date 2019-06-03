//
//  APIRepositoryImpl.swift
//  TesteSantander
//
//  Created by Felipe Alexander Silva Melo on 29/05/19.
//  Copyright © 2019 Felipe Alexander Silva Melo. All rights reserved.
//

import Foundation
import RxSwift
import Moya

final class APIRepositoryImpl: APIRepository {
    
    let service: APIService
    
    init(service: APIService) {
        self.service = service
    }
    
    func login(user: String, password: String) -> Single<User> {
        return service
                .login(user, password)
                .map(User.self)
    }
    
    func fetchStatements(userId: Int) -> Single<UserStatements> {
        return service
                .fetchStatements(userId)
                .map(UserStatements.self)
    }
}
