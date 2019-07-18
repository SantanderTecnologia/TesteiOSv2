//
//  UserStruct.swift
//  Desafio_Santander
//
//  Created by fernanda.pereira on 10/07/19.
//  Copyright © 2019 fernanda.pereira. All rights reserved.
//

import Foundation


struct UserResponse: Codable {
    let user: Usuario
    
    enum CodingKeys: String, CodingKey {
        case user = "userAccount"
    }
}

struct Usuario: Codable {
    let userId: Int
    let name: String
    let conta: String
    let agencia: String
    let saldo: Double
    
    enum CodingKeys: String, CodingKey {
        case userId
        case name
        case conta = "bankAccount"
        case agencia = "agency"
        case saldo = "balance"
    }
}
