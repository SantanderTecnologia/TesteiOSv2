//
//  Login.swift
//  SANTANDER
//
//  Created by Maíra Preto on 23/02/20.
//  Copyright © 2020 Maíra Acioli. All rights reserved.
//

import Foundation


// MARK: - UserAccount
struct Account: Codable {
    let userAccount: UserAccount?
    let error: ErrorAccount?
}

// MARK: - Error
struct ErrorAccount: Codable {
}

// MARK: - UserAccount
struct UserAccount: Codable {
    let userID: Int?
    let name, bankAccount, agency: String?
    let balance: Double?
    
    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case name, bankAccount, agency, balance
    }
}
