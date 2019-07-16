//
//  StatementList.swift
//  TestSantander
//
//  Created by ely.assumpcao.ndiaye on 08/07/19.
//  Copyright © 2019 ely.assumpcao.ndiaye. All rights reserved.
//

import Foundation

// MARK: - UserAccount
struct Statement: Decodable {
    let statementList: [StatementList]
    let error: Error
}

// MARK: - Error
struct Error: Codable {
}

// MARK: - StatementList
struct StatementList: Codable {
    let title, desc, date: String
    let value: Double
}

