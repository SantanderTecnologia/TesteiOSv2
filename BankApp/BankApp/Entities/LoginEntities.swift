//
//  LoginEntities.swift
//  BankApp
//
//  Created by Bruno Maciel on 1/16/21.
//

import Foundation

struct LoginForm: Encodable {
    var username: String
    var password: String
}


struct LoginResponseStruct: Decodable {
    let userAccount: LoggedinUserStruct
    let error: BadRequestStruct
}

struct LoggedinUserStruct: Decodable {
    let userId: Int?
    let name: String?
    let bankAccount: String?
    let agency: String?
    let balance: Float?
}

struct BadRequestStruct: Decodable {
    let code: Int?
    let message: String?
    
    init?(badRequest: BadRequestStruct) {
        guard
            let code = badRequest.code,
            let message = badRequest.message
            else { return nil }
        
        self.code = code
        self.message = message
    }
}
