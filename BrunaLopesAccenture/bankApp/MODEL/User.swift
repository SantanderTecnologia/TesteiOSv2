//
//  Usuario.swift
//  bankApp
//
//  Created by bruna.lopes.d.santos on 08/07/19.
//  Copyright © 2019 bruna.lopes.d.santos. All rights reserved.
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
    let name: String
    let count: String
    let agency: String
    let balance: Double
    
    enum CodingKeys: String, CodingKey {
        case userId
        case name
        case count = "bankAccount"
        case agency
        case balance
    }
}

