//
//  UserLoginData.swift
//  BankApp
//  Struct for store data when make POST request with user and password.
//
//  Created by Adriano Rodrigues Vieira on 02/03/21.
//

import Foundation

struct UserLoginData: Codable {
    let error: ErrorData?
    let userAccount: UserAccountData?
        
    struct ErrorData: Codable {
        let code: Int?
        let message: String?
    }
    
    struct UserAccountData: Codable {
        let userId: Int?
        let name: String?
        let bankAccount: String?
        let agency: String?
        let balance: Double?
    }
}

// MARK: - Struct UserLoginCredentialParameters. Struct used for sending user and password in body request as JSON parameter.
struct UserLoginCredentialsParameters: Encodable {
    let user: String
    let password: String    
}


