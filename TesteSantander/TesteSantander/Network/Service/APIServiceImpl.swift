//
//  APIServiceImpl.swift
//  TesteSantander
//
//  Created by Felipe Alexander Silva Melo on 29/05/19.
//  Copyright © 2019 Felipe Alexander Silva Melo. All rights reserved.
//

import Foundation
import RxSwift
import Moya

final class APIServiceImpl: APIService {
    
    let provider: MoyaProvider<APIRouter>
    
    init(provider: MoyaProvider<APIRouter>) {
        self.provider = provider
    }
    
    func login(_ user: String, _ password: String) -> Single<Response> {
        return provider.rx.request(.login(user, password))
    }
    
    func fetchStatements(_ userId: Int) -> Single<Response> {
        return provider.rx.request(.fetchStatements(userId))
    }
}
