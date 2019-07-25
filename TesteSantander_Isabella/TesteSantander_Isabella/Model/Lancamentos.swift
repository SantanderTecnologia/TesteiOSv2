//
//  Statements.swift
//  TesteSantander_Isabella
//
//  Created by isabella.bitencourt on 10/07/19.
//  Copyright © 2019 isabella.bitencourt. All rights reserved.
//

import Foundation

struct listaLancamentos: Codable {
    let lancamento: Lancamentos
    
    enum CodingKeys: String, CodingKey {
        case lancamento = "statementslist"
    }
}
struct Lancamento: Codable{
    let title: String
    let desc: String
    let date: Date
    let value: Double
    
}
