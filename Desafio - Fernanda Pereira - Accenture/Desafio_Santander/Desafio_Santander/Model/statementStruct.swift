//
//  statementStruct.swift
//  Desafio_Santander
//
//  Created by fernanda.pereira on 11/07/19.
//  Copyright © 2019 fernanda.pereira. All rights reserved.
//

import Foundation

struct StatementResponse: Codable {
    let transactions: [Transactions]
    
    
    enum CodingKeys: String, CodingKey {
        case transactions = "statementList"
    }
}

struct Transactions: Codable {
    let title: String!
    let description: String!
    let date: String!
    let value: Double
    
    enum CodingKeys: String, CodingKey {
        case title
        case description = "desc"
        case date
        case value
    }
}
