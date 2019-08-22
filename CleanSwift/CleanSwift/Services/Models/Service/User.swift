//
//  User.swift
//  CleanSwift
//
//  Created by Samanta Coutinho on 2019-08-06.
//  Copyright © 2019 Sam. All rights reserved.
//

import Foundation

struct User: Codable {
    let userAccount: UserInfo
    let error: ErrorResponse
}

struct UserInfo: Codable {
    let userId: Double?
    let name: String?
    let bankAccount: String?
    let agency: String?
    let balance: Double?
}

struct ErrorResponse: Codable {
    let code: Int?
    let message: String?
}
