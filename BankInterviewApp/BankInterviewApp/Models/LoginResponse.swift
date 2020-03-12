//
//  LoginResponse.swift
//  BankInterviewApp
//
//  Created by Osias Carneiro on 10/03/20.
//  Copyright © 2020 Osias Carneiro. All rights reserved.
//

struct LoginResponse: Codable {
    
    var userAccount: User
    var error: Error
    
}

struct User: Codable {
    
    var userId: Int?
    var name: String?
    var bankAccount: String?
    var agency: String?
    var balance: Float?
    
}

