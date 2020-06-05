//
//  Login.swift
//  Bank
//
//  Created by Junior Obici on 13/01/20.
//  Copyright © 2020 Junior Obici. All rights reserved.
//

import Foundation

struct LoginResponse: Codable {
    let user: User
    
    enum CodingKeys: String, CodingKey {
        case user = "userAccount"
    }
}

struct User: Codable {
    let userId: Int
    let userName: String
    let userAccount: String
    let userAgency: String
    let userBalance: Double
    
    enum CodingKeys: String, CodingKey {
        case userId
        case userName = "name"
        case userAccount = "bankAccount"
        case userAgency = "agency"
        case userBalance = "balance"
    }
}
