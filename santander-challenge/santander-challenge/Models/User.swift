//
//  User.swift
//  santander-challenge
//
//  Created by Kevin Oliveira on 02/05/20.
//  Copyright © 2020 Kevin Oliveira. All rights reserved.
//

import Foundation
import SwiftyJSON

class User {
    var id: Int
    var name: String
    var agency: Int
    var account: Int
    var balance: Float

    init(id: Int, name: String, agency: Int, account: Int, balance: Float) {
        self.id = id
        self.name = name
        self.agency = agency
        self.account = account
        self.balance = balance
    }

    static func fromJSON(json: JSON) -> User {
        return User(
            id: json["userId"].intValue,
            name: json["name"].stringValue,
            agency: json["agency"].intValue,
            account: json["bankAccount"].intValue,
            balance: json["balance"].floatValue
        )
    }
}

extension User: Equatable {
    static func == (lhs: User, rhs: User) -> Bool {
        let equalIds = lhs.id == rhs.id
        let equalNames = lhs.name == rhs.name
        let equalAgencys = lhs.agency == rhs.agency
        let equalAccounts = lhs.account == rhs.account
        let equalBalances = lhs.balance == rhs.balance

        return equalIds && equalNames && equalAgencys && equalAccounts && equalBalances
    }
}
