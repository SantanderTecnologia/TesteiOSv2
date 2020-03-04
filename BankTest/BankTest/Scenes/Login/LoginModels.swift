//
//  LoginModels.swift
//  BankTest
//
//  Created by Luan Nascimento Almeida on 02/03/20.
//  Copyright (c) 2020 bank. All rights reserved.

import UIKit

enum Login {

    struct Request {

        var user: String?
        var password: String?
    }

    struct Response: Codable {
        var userAccount: UserAccount
    }

    class ViewModel {
        private var userAccount: UserAccount

        init(userAccount: UserAccount) {
            self.userAccount = userAccount
        }

        var name: String {
            return self.userAccount.name.capitalized
        }

        var branchAndAccount: String {
            return "\(self.userAccount.bankAccount) / \(self.userAccount.agency)"
        }

        var balance: String {
            return self.userAccount.balance.toCurrency()
        }
    }
}

struct UserAccount: Codable {
    let userId: Int
    let name: String
    let bankAccount: String
    let agency: String
    let balance: Double
}
