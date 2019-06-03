//
//  User.swift
//  TesteSantander
//
//  Created by Felipe Alexander Silva Melo on 29/05/19.
//  Copyright © 2019 Felipe Alexander Silva Melo. All rights reserved.
//

import Foundation

struct User: Codable {
    let userAccount: UserAccount
    let error: APIError
}

struct UserAccount: Codable {
    let userId: Int?
    let name: String?
    let bankAccount: String?
    let agency: String?
    let balance: Double?
    
    static func onError() -> UserAccount {
        return UserAccount(
            userId: 0,
            name: Constants.Errors.UIStringError,
            bankAccount: Constants.Errors.UIStringError,
            agency: Constants.Errors.UIStringError,
            balance: Constants.Errors.UIDoubleError
        )
    }
}
