//
//  UserAccount.swift
//  Santander Teste iOS
//
//  Created by Lucas Ferraciolli Assis on 14/06/19.
//  Copyright © 2019 Lucas Conte. All rights reserved.
//

import Foundation
struct UserAccount: Decodable {
    var userId: Int
    var name: String
    var bankAccount: String
    var agency: String
    var balance: Float
}
