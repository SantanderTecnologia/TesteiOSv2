//
//  Login.swift
//  BankAPP
//
//  Created by Alexandre Carlos Aun on 11/07/20.
//  Copyright © 2020 Alexandre Carlos Aun. All rights reserved.
//

import Foundation

struct Login: Codable {
    let userAccount: [DataUser]
}

struct DataUser: Codable {
    let userId: Int
    let email: String
    let cpf: String
    let name: String
    let bankAccount: String
    let agency: String
    let balance: Double
}
