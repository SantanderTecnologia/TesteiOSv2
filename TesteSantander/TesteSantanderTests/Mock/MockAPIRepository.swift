//
//  MockAPIRepository.swift
//  TesteSantanderTests
//
//  Created by Felipe Alexander Silva Melo on 03/06/19.
//  Copyright © 2019 Felipe Alexander Silva Melo. All rights reserved.
//

import Foundation
import RxSwift

@testable import TesteSantander

class MockAPIRepository: APIRepository {
    
    var success: Bool
    var emptyResponse: Bool = false
    
    let service: APIService
    
    init(success: Bool, service: APIService = MockAPIService()) {
        self.success = success
        self.service = service
    }
    
    func login(user: String, password: String) -> Single<User> {
        if success {
            return Single
                    .just(Seeds.Users.joao)
                    .delaySubscription(1, scheduler: MainScheduler.instance)
        } else {
            let subject = PublishSubject<User>()
            subject.onError(APIError(code: TestConstants.loginErrorCode, message: TestConstants.loginErrorMessage))
            return subject.asSingle()
        }
    }
    
    func fetchStatements(userId: Int) -> Single<UserStatements> {
        if success {
            if emptyResponse {
                return Single
                        .just(Seeds.Statements.emptyStatements)
                        .delaySubscription(1, scheduler: MainScheduler.instance)
            } else {
                return Single
                        .just(Seeds.Statements.statements)
                        .delaySubscription(1, scheduler: MainScheduler.instance)
            }
        } else {
            let subject = PublishSubject<UserStatements>()
            subject.onError(APIError(code: TestConstants.statementsErrorCode, message: TestConstants.statementsErrorMessage))
            return subject.asSingle()
        }
    }
}
