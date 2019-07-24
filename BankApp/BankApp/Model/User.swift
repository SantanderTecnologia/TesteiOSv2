//
//  User.swift
//  BankApp
//
//  Created by Visão Grupo on 7/20/19.
//  Copyright © 2019 Vinicius Teixeira. All rights reserved.
//

import Foundation

struct User: Decodable {
    var userId: Int
    var login: String?
    var password: String?
    var name: String
    var bankAccount: String
    var agency: String
    var balance: Double
}
