//
//  AuthClientUseCaseProtocol.swift
//  Domain
//
//  Created by Estaife Lima on 30/05/20.
//  Copyright © 2020 Estaife Lima. All rights reserved.
//

import Foundation

public protocol AuthClientUseCaseProtocol {
    func login(authenticationModel: AuthClientModel, completion: @escaping (Result<UserAccountResponse, DomainError>) -> Void)
}
