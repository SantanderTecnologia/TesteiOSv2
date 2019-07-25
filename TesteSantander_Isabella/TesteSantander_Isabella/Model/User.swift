//
//  User.swift
//  TesteSantander_Isabella
//
//  Created by isabella.bitencourt on 23/07/19.
//  Copyright © 2019 isabella.bitencourt. All rights reserved.
//


import Foundation


struct UserResponse: Codable {
    let user: User
    
    enum CodingKeys: String, CodingKey {
        case user = "userAccount"
    }
}

struct User: Codable {
    let userId: Int
    let userName: String
    let userBankAccount: String
    let userAgency: String
    let userAccountBalance: Double
    
    enum CodingKeys: String, CodingKey {
        case userId
        case userName = "name"
        case userBankAccount = "bankAccount"
        case userAgency = "agency"
        case userAccountBalance = "balance"
    }
}



