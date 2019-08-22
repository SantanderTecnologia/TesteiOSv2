//
//  Statements.swift
//  CleanSwift
//
//  Created by Samanta Coutinho on 2019-08-06.
//  Copyright © 2019 Sam. All rights reserved.
//

import Foundation

struct StatementList: Codable {
    let statementList: [Statement]
}

struct Statement: Codable {
    let title: String
    let desc: String
    let date: String
    let value: Double
}
