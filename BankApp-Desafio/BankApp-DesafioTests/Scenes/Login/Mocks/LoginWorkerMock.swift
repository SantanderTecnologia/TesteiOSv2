//
//  LoginWorkerMock.swift
//  BankApp-DesafioTests
//
//  Created by Mizia Lima on 2/28/21.
//

import Foundation
@testable import BankApp_Desafio

class LoginWorkerMock: LoginWorker {
    var loginWasCalled: Bool = false
    var isSuccesCase: Bool = true
    var isFailledCase: Bool = true
    
    override func login(username: String, password: String, completion: @escaping (Result<Login.Response, ServiceError>) -> Void) {
        
        self.loginWasCalled = true
        
        if isSuccesCase {
            let response = LoginResponseMock.createResponse()
            completion(.success(response))
        } else {
            //completion(.failure(.invalidData))
        }
        
        if isFailledCase {
            completion(.failure(.invalidData))
        }
    }
}
