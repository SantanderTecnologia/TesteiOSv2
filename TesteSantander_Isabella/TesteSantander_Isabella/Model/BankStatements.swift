//
//  BankStatements.swift
//  TesteSantander_Isabella
//
//  Created by isabella.bitencourt on 23/07/19.
//  Copyright © 2019 isabella.bitencourt. All rights reserved.
//

import Foundation


struct BankStatementsResponse: Codable {
    let bankStatements: [BankStatements]
    
    enum CodingKeys: String, CodingKey {
        case bankStatements = "statementList"
    }
}

struct BankStatements: Codable {
    let statementTitle: String
    let statementDescription: String
    let statementDate: String
    let statementValue: Double
    
    enum CodingKeys: String, CodingKey {
        case statementTitle = "title"
        case statementDescription = "desc"
        case statementDate = "date"
        case statementValue = "value"
    }
}



