//
//  Header.swift
//  BankAppTest
//
//  Created by Ailton Lessa on 18/02/20.
//  Copyright © 2020 Ailton. All rights reserved.
//


import Foundation

// MARK: - Header
struct LoginResponse: Codable {
    let userAccount: UserAccount
    let error: HeaderError
}

// MARK: - Error
struct HeaderError: Codable {
}

// MARK: - UserAccount
struct UserAccount: Codable {
    let userID: Int
    let name, bankAccount, agency: String
    let balance: Double

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case name, bankAccount, agency, balance
    }
}
