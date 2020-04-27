//
//  LoginResponse.swift
//  Bank
//
//  Created by Matheus Rodrigues Ribeiro on 25/04/20.
//  Copyright © 2020 Bank. All rights reserved.
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

