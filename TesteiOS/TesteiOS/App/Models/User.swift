//
//  User.swift
//  TesteIOS
//
//  Created by VM on 26/07/20.
//  Copyright © 2020 VM. All rights reserved.
//

import Foundation

struct User: Codable {
    let userAccount: UserAccount?
    let error: LoginError?
}

struct UserAccount: Codable {
    let userID: Int?
    let name: String?
    let bankAccount: String?
    let agency: String?
    let balance: Double?
    
    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case name, bankAccount, agency, balance
    }
}

struct LoginError: Codable { }

extension User {
    static func parse(responseData: Data?) -> User? {
        var user: User?
        guard let data = responseData else { return user }
        do {
            let decoder = JSONDecoder()
            user = try decoder.decode(User.self, from: data)
        } catch let err {
            print("Error: ", err)
        }
        
        return user
    }
}
