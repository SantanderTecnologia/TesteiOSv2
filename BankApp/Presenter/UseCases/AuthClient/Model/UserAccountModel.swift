//
//  UserAccountModel.swift
//  Presenter
//
//  Created by Estaife Lima on 07/06/20.
//  Copyright © 2020 Estaife Lima. All rights reserved.
//

import Foundation

public struct UserAccountModel: Equatable {
    public var identifier: String
    public let name: String
    public let bankAccount: String
    public let agency: String
    public let balance: Double
    
    public init(identifier: String, name: String, bankAccount: String, agency: String, balance: Double) {
        self.identifier = identifier
        self.name = name
        self.bankAccount = bankAccount
        self.agency = agency
        self.balance = balance
    }
}
