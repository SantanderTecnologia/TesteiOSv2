//
//  Usuario.swift
//  DesafioBankSantander
//
//  Created by fabiana.c.almeida on 7/14/19.
//  Copyright © 2019 b. All rights reserved.
//

import Foundation

struct UsuarioResponse: Codable {
    let client: Client
    
    enum CodingKeys: String, CodingKey {
        case user = "userAccount"
    }
}

struct Client: Codable {
    let userId: Int
    let name: String
    let account: String
    let agency: String
    let balance: Double
    //enum traz os dados do json e faz um merge com minhas variaveis da struct
    enum CodingKeys: String, CodingKey {
        case userId
        case name
        case account = "bankAccount"
        case agency = "agency"
        case balance = "balance"
    }
}
