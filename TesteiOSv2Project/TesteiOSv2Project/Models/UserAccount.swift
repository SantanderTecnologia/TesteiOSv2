//
//  UserAccount.swift
//  TesteiOSv2Project
//
//  Created by Andrey on 11/06/20.
//  Copyright © 2020 Andrey Matos. All rights reserved.
//

import Foundation

struct UserAccount: Codable {
    var userId: Int?
    var name: String?
    var bankAccount: String?
    var agency: String?
    var balance: Double?
    
    enum CodingKeys: String, CodingKey{
        case userId
        case name
        case bankAccount
        case agency
        case balance
    }
}
