//
//  Transacao.swift
//  DesafioStd
//
//  Created by bianca.dos.s.sobral on 17/07/19.
//  Copyright © 2019 bianca.dos.s.sobral. All rights reserved.
//

import Foundation

struct ListaDetransacoes : Codable {
    let transacao : [Transacao]
    
    enum CodingKeys: String, CodingKey {
        case transacao = "statementList"
    }
}

struct Transacao: Codable{
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

