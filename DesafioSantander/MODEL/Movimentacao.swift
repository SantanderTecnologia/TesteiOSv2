//
//  Movimentacao.swift
//  DesafioSantander
//
//  Created by daianne.gomes.aguiar on 05/07/19.
//  Copyright © 2019 daianne.gomes.aguiar. All rights reserved.
//

import Foundation

struct Compomentes : Codable{
    let movimentacao : [Movimentacao]
    
    enum CodingKeys: String, CodingKey {
        case movimentacao = "statementList"
    }
}

struct Movimentacao : Codable {
    let tema : String!
    let desc: String!
    let data : String!
    let valor : Double!
    
    enum CodingKeys : String, CodingKey {
        case tema = "title"
        case desc
        case data = "date"
        case valor = "value"
    }
    
}
