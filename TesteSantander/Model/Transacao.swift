//
//  Transacao.swift
//  TesteSantander
//
//  Created by bianca.butti.almeida on 12/07/19.
//  Copyright © 2019 bianca.butti.almeida. All rights reserved.
//

import Foundation

struct TransacaoResponse: Codable {
    let listaTransacoes: [Transacao]
    
    enum CodingKeys: String, CodingKey{
        case listaTransacoes = "statementList"
    }
}
    
struct Transacao: Codable {
        let titulo: String
        let descricao: String
        let data: String
        let valor: Double
        
        enum CodingKeys: String, CodingKey { 
            case titulo = "title"
            case descricao = "desc"
            case data = "date"
            case valor = "value"
        }
}
