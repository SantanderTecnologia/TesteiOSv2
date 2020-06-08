//
//  UserAccountModel.swift
//  Domain
//
//  Created by Estaife Lima on 30/05/20.
//  Copyright © 2020 Estaife Lima. All rights reserved.
//

import Foundation

public struct UserAccountResponse: BaseModel {
    public let userAccount: UserAccountInternalResponse
    public var authError: AuthError

    public init(userAccount: UserAccountInternalResponse, authError: AuthError) {
        self.userAccount = userAccount
        self.authError = authError
    }
    
    public static func == (lhs: UserAccountResponse, rhs: UserAccountResponse) -> Bool {
        return lhs.userAccount.userID == rhs.userAccount.userID
    }
    
    enum CodingKeys: String, CodingKey {
        case authError = "error"
        case userAccount
    }
}

public struct UserAccountInternalResponse: Codable, Equatable {
    public var userID: Int?
    public let name: String?
    public let bankAccount: String?
    public let agency: String?
    public let balance: Double?
    
    public init(userID: Int, name: String, bankAccount: String, agency: String, balance: Double) {
        self.userID = userID
        self.name = name
        self.bankAccount = bankAccount
        self.agency = agency
        self.balance = balance
    }

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case name, bankAccount, agency, balance
    }
}

public struct AuthError: BaseModel {
    public var code: Int?
    public var message: String?
    
    public init(code: Int? = nil, message: String? = nil) {
        self.code = code
        self.message = message
    }
}
