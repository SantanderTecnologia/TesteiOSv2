//
//  UserModel.swift
//  TesteiOSv2
//
//  Created by Foliveira on 04/06/20.
//  Copyright © 2020 Foliveira. All rights reserved.
//

import Foundation


// MARK: - Auth
struct UserAuthModel {
    var name, password: String
}


// MARK: - UserResponse
struct UserResponseModel: Codable {
    let userAccount: UserInfo?
    let error: customError?
}

// MARK: - Error
struct customError: Codable {
    let message: String?
}

// MARK: - UserAccount
struct UserInfo: Codable {
    let userId: Int?
    let name, bankAccount, agency: String?
    let balance: Double?
    
    enum CodingKeys: String, CodingKey {
        case userId
        case name, bankAccount, agency, balance
    }
}
