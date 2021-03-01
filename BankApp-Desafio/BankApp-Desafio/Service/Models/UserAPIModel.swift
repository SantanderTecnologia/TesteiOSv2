//
//  User.swift
//  BankApp-Desafio
//
//  Created by Mizia Lima on 2/27/21.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let user = try? newJSONDecoder().decode(User.self, from: jsonData)

import Foundation

// MARK: - User
struct UserAPIModel: Decodable {
    let userAccount: UserAccount
    let error: UserError
}

// MARK: - Error
struct UserError: Decodable { }

// MARK: - UserAccount
struct UserAccount: Decodable {
    let userID: Int?
    let name: String
    let bankAccount: String
    let agency: String
    let balance: Double

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case name, bankAccount, agency, balance
    }
}
