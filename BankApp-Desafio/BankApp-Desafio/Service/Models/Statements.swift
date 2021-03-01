//
//  Statements.swift
//  BankApp-Desafio
//
//  Created by Mizia Lima on 2/28/21.
//

import Foundation

// MARK: - Statement
struct StatementAPIModel: Decodable {
    let statementList: [StatementList]
    let error: StatementError
}

// MARK: - Error
struct StatementError: Decodable {
}

// MARK: - StatementList
struct StatementList: Decodable {
    let title, desc, date: String
    let value: Double
}
