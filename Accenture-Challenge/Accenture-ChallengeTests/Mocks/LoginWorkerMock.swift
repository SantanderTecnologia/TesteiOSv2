//
//  LoginWorkerMock.swift
//  Accenture-ChallengeTests
//
//  Created by Pedro Alvarez on 05/07/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

@testable import Accenture_Challenge

class LoginWorkerMock: LoginWorkerProtocol {
    
    func fetchLogin(request: Login.Info.LoginRequest, completion: @escaping LoginResponseCallback) {
        completion(.success(Login.Info.LoginResponse(userId: 1,
                                                     name: "username",
                                                     bankAccount: "12345",
                                                     agency: "agency",
                                                     balance: 10.0)))
    }
}
