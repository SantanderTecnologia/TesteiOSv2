//
//  LoginWorkerMock.swift
//  BankAppTests
//
//  Created by José Inácio Athayde Ferrarini on 19/03/20.
//  Copyright © 2020 br.com.solutis.inacioferrarini. All rights reserved.
//

import Foundation
@testable import BankApp

class LoginWorkerMock: LoginWorker {

    var doLoginClojure: ((Login.Authentication.Request) -> (Result<Login.Authentication.Response?, Error>))

    init(_ doLoginClojure: @escaping ((Login.Authentication.Request) -> (Result<Login.Authentication.Response?, Error>))) {
        self.doLoginClojure = doLoginClojure
    }
    
    override func doLogin(with request: Login.Authentication.Request, completion: @escaping ((Result<Login.Authentication.Response?, Error>) -> Void)) {
        let result = doLoginClojure(request)
        completion(result)
    }
    
}
