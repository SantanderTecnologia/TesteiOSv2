//
//  Lancamentos.swift
//  BankTest
//
//  Created by Jaber Vieira Da Silva Shamali on 05/04/21.
//

import Foundation


struct Lancamento: Codable {
    var statementList: [LancamentoList]?
    
    enum CodingKeys: String, CodingKey {
        case statementList = "statementList"
    }
}

struct LancamentoList: Codable {
    var title: String
    var desc: String
    var date: String
    var value: Double
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case desc = "desc"
        case date = "date"
        case value = "value"
    }
}

struct LancamentoConvert: Codable {
    var title: String?
    var desc: String?
    var date: String?
    var value: String?
    
}
