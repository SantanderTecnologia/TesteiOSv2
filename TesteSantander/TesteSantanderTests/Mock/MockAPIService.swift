//
//  MockAPIService.swift
//  TesteSantanderTests
//
//  Created by Felipe Alexander Silva Melo on 31/05/19.
//  Copyright © 2019 Felipe Alexander Silva Melo. All rights reserved.
//

import Foundation
import Moya
import RxSwift

@testable import TesteSantander

class MockAPIService: APIService {
    
    let provider: MoyaProvider<APIRouter>
    
    init(provider: MoyaProvider<APIRouter> = MoyaProvider(stubClosure: MoyaProvider.immediatelyStub)) {
        self.provider = provider
    }
    
    func login(_ user: String, _ password: String) -> Single<Response> {
        return provider.rx.request(.login(user, password))
    }
    
    func fetchStatements(_ userId: Int) -> Single<Response> {
        return provider.rx.request(.fetchStatements(userId))
    }
}
