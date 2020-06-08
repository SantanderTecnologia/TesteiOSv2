//
//  AuthClientUseCaseSpy.swift
//  PresenterTests
//
//  Created by Estaife Lima on 04/06/20.
//  Copyright © 2020 Estaife Lima. All rights reserved.
//

import Domain

class AuthClientUseCaseSpy {
    var authClientModel: AuthClientModel?
    var completion: ((Result<UserAccountResponse, DomainError>) -> Void)?
    
    func completeWith(error: DomainError) {
        completion?(.failure(.unknown))
    }
    
    func completeWith(model: UserAccountResponse) {
        completion?(.success(model))
    }
}

extension AuthClientUseCaseSpy: AuthClientUseCaseProtocol {
    func login(authenticationModel: AuthClientModel, completion: @escaping (Result<UserAccountResponse, DomainError>) -> Void) {
        self.authClientModel = authenticationModel 
        self.completion = completion
    }
}
