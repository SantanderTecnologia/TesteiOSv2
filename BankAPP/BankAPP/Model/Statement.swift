//
//  Statement.swift
//  BankAPP
//
//  Created by Alexandre Carlos Aun on 14/07/20.
//  Copyright © 2020 Alexandre Carlos Aun. All rights reserved.
//

import Foundation

struct Statement: Codable {
    let statementUsers: [StatementUser]
}

struct StatementUser: Codable {
    let userId: Int
    let statementList: [StatementList]
}

struct StatementList: Codable {
   let title: String
   let desc: String
   let date: String
   let value: Double
}
