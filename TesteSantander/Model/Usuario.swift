//
//  Usuario.swift
//  TesteSantander
//
//  Created by bianca.butti.almeida on 10/07/19.
//  Copyright © 2019 bianca.butti.almeida. All rights reserved.
//

import Foundation

struct UsuarioResponse: Codable {
    let user: Usuario
    
    
    enum CodingKeys: String, CodingKey{
        case user = "userAccount"
    }
}

struct Usuario: Codable {
    let userId: Int
    let name: String
    let conta: String
    let agencia: String
    let saldo: Double
    
    enum CodingKeys: String, CodingKey{
        case userId
        case name
        case conta = "bankAccount"
        case agencia = "agency"
        case saldo = "balance"
    }
}
