//
//  Statement.swift
//  TesteSantander
//
//  Created by Felipe Alexander Silva Melo on 30/05/19.
//  Copyright © 2019 Felipe Alexander Silva Melo. All rights reserved.
//

import Foundation

struct UserStatements: Codable {
    let statementList: [Statement]
    let error: APIError
}

struct Statement: Codable {
    let title: String?
    let desc: String?
    let date: String?
    let value: Double?
}
