//
//  AccountInfo.swift
//  TCS_Challenge
//
//  Created by Rafael Valer on 14/07/20.
//  Copyright © 2020 Rafael Valer. All rights reserved.
//

import Foundation

struct AccountInfo: Decodable {
    var userId: Int
    var name: String
    var bankAccount: String
    var agency: String
    var balance: Double
}
