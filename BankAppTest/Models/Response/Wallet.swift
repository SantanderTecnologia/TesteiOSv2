//
//  Wallet.swift
//  BankAppTest
//
//  Created by Ailton Lessa on 18/02/20.
//  Copyright © 2020 Ailton. All rights reserved.
//

import Foundation

// MARK: - Welcome
struct Wallet: Codable {
    let statementList: [StatementList]
    let error: HeaderError
}

// MARK: - Error
struct WalletErrors: Codable {
}

// MARK: - StatementList
struct StatementList: Codable {
    let title, desc, date: String
    let value: Double
}
