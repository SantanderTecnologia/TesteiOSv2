//
//  UserAccount.swift
//  Williamberg Bank
//
//  Created by padrao on 23/05/20.
//  Copyright © 2020 Williamberg. All rights reserved.
//

import Foundation

struct UserAccount: Codable {
    let userId: Int
    let name: String
    let bankAccount: String
    let agency: String
    let balance: Double
}
