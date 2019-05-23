//
//  LoginModel.swift
//  BankApp
//
//  Created by Pedro Veloso on 20/05/19.
//  Copyright © 2019 pedrofveloso. All rights reserved.
//

import Foundation

struct LoginModel: Codable {
    let id: Int
    let name: String
    let bankAccount: String
    let agency: String
    let balance: Double
    
    private enum ParentKey: CodingKey {
        case userAccount
    }
    
    private enum Keys: String, CodingKey {
        case id = "userId"
        case name
        case bankAccount
        case agency
        case balance
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ParentKey.self)
        let userAccount = try container.nestedContainer(keyedBy: Keys.self, forKey: .userAccount)
        id = try userAccount.decode(Int.self, forKey: .id)
        name = try userAccount.decode(String.self, forKey: .name)
        bankAccount = try userAccount.decode(String.self, forKey: .bankAccount)
        agency = try userAccount.decode(String.self, forKey: .agency)
        balance = try userAccount.decode(Double.self, forKey: .balance)
    }
}

extension LoginModel: Equatable {
    static func == (lhs: LoginModel, rhs: LoginModel) -> Bool {
        return lhs.name == rhs.name &&
        lhs.agency == rhs.agency &&
        lhs.balance == rhs.balance &&
        lhs.bankAccount == rhs.bankAccount &&
        lhs.id == rhs.id
    }
}
