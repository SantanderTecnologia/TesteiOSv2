//
//  Transaction.swift
//  Bank
//
//  Created by Junior Obici on 13/01/20.
//  Copyright © 2020 Junior Obici. All rights reserved.
//

import Foundation

struct TransactionResponse: Codable {
    let statementList: [Transaction]
    
    enum CodingKeys: String, CodingKey {
        case statementList = "statementList"
    }
}

struct Transaction: Codable {
    let title: String
    let desc: String
    let date: String
    let value: Double
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case desc = "desc"
        case date = "date"
        case value = "value"
    }
}
