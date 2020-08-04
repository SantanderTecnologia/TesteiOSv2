//
//  UserAccount.swift
//  Teste_iOS_v2
//
//  Created by Lucas Fernandes Araujo on 03/08/20.
//  Copyright © 2020 Lucas Fernandes Araujo. All rights reserved.
//

import Foundation

struct UserAccount: Codable {
    let userId: Int?
    let name: String?
    let bankAccount: String?
    let agency: String?
    let balance: Double?
}
