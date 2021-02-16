//
//  StatementsEntities.swift
//  BankApp
//
//  Created by Bruno Maciel on 1/16/21.
//

import Foundation

struct StatementsResponseStruct: Decodable {
    let statementList: [StatementStruct]
    let error: BadRequestStruct
}

struct StatementStruct: Decodable {
    let title: String
    let desc: String
    let date: String
    let value: Float
}
