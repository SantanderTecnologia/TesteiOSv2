
//
//  RetrieveCredentialsSpy.swift
//  PresenterTests
//
//  Created by Estaife Lima on 08/06/20.
//  Copyright © 2020 Estaife Lima. All rights reserved.
//

import Presenter

class RetrieveCredentialsSpy: RetrieveCredentialsProtocol {
    
    public var credentials: AuthUserViewModel?
    private var emit: ((AuthUserViewModel) -> Void)?
    
    public func observerCredentials(completion: @escaping (AuthUserViewModel) -> Void) {
        emit = completion
    }
    
    func resultWith(credentials: AuthUserViewModel) {
        emit?(credentials)
    }
}
