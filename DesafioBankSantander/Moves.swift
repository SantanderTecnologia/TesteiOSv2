//
//  Movimentacao.swift
//  DesafioBankSantander
//
//  Created by fabiana.c.almeida on 7/16/19.
//  Copyright © 2019 b. All rights reserved.
//

import Foundation
/* statementList é uma chave que é dicionario, composta por um conjunto de de chaves e valores, extraida do SJON */
struct statementList: Codable {
    let moves: [Moves]
    
    enum CodingKeys: String, CodingKey {
        case moves = "statementList"
    }
}

struct Moves: Codable{
    let title: String
    let desc: String
    let date: String
    let value: Double
    
    enum Condingkeys: String,CodingKey{
        case title
        case desc
        case date
        case value
    }
}


