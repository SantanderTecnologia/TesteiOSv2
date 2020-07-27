//
//  MockLoginWorker.swift
//  SantanderTestTests
//
//  Created by Maria Eugênia Pereira Teixeira on 27/07/20.
//  Copyright © 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import Foundation
import PromiseKit
@testable import SantanderTest

enum LoginReturnTypes {
    case invalidPassword
    case emptyField
    case success(reques: Login.Request)
}

class MockLoginWorker: LoginNetworkLogic {
    
    var returnType: LoginReturnTypes = .success(reques: Login.Request(user: "User", password: "Test@190"))
    
    func performLogin(with request: Login.Request) -> Promise<Login.Response> {
        
        switch returnType {
        case .invalidPassword:
            return Promise { seal in seal.reject(NetworkError.custom(Strings.Error.invalidPassword))}
        case .emptyField:
            return Promise { seal in seal.reject(NetworkError.custom(Strings.Error.emptyFields))}
        case .success(let request):
            guard !request.user.isEmpty, !request.password.isEmpty else {
                return Promise { seal in seal.reject(NetworkError.custom(Strings.Error.emptyFields))}
            }
            let reader = JSONFileReader()
            if let response: Login.Response = reader.read(filename: "login") {
                return Promise { seal in seal.fulfill(response)}
            } else {
                return Promise { seal in seal.reject(NetworkError.parserError)}
            }
        }
    }
    
}
