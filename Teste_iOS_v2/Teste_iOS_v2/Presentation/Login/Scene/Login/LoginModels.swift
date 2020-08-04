//
//  LoginModels.swift
//  Teste_iOS_v2
//
//  Created by Lucas Fernandes Araujo on 03/08/20.
//  Copyright © 2020 Lucas Fernandes Araujo. All rights reserved.
//

import Foundation

struct LoginModels {
    struct Request {
        let login: LoginModel
        let success: GenericResponse
        let failure: EmptyClosure
    }
    
    struct Response {
        let response: LoginResponse
    }
}
