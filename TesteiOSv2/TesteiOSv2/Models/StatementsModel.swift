//
//  StatementsModel.swift
//  TesteiOSv2
//
//  Created by Foliveira on 12/06/20.
//  Copyright © 2020 Foliveira. All rights reserved.
//

import Foundation

// MARK: - Welcome
struct StatementResponse: Codable {
    let statementList: [Statement]
    let error: StatementError
}

// MARK: - Error
struct StatementError: Codable {
}

// MARK: - StatementList
struct Statement: Codable {
    let title, desc, date: String
    let value: Double
}
