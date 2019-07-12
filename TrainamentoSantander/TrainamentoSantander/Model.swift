//
//  Model.swift
//  TrainamentoSantander
//
//  Created by matheus.p.souza on 10/07/19.
//  Copyright © 2019 matheus.p.souza. All rights reserved.
//

import Foundation

//Mark: login
struct UsuarioResponse: Codable {
    let userAccount: Usuario
    
    enum CodingKeys: String, CodingKey {
        case userAccount
    }
}

struct Usuario: Codable {
    let userId: Int
    let name: String
    let bankAccount: String
    let agency: String
    let balance: Double
    
    enum CodingKeys: String, CodingKey {
        case userId
        case name
        case bankAccount
        case agency
        case balance
    }
}

// Mark: extrato
struct StatementListResponse: Codable {
    let statementList: [StatementList]
    
    enum CodingKeys: String, CodingKey {
        case statementList
    }
}

struct StatementList: Codable {
    let title: String
    let desc: String
    let date: String
    let value: Double
    
    enum CodingKeys: String, CodingKey {
        case title
        case desc
        case date
        case value
    }
}

class GravarDados {
    
    static let gd = GravarDados()
    
    var userSalvo = String()
    var passwordSalvo = String()
    
}
