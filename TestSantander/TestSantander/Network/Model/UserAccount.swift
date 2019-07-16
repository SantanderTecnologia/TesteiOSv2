//
//  UserAccount.swift
//  TestSantander
//
//  Created by ely.assumpcao.ndiaye on 08/07/19.
//  Copyright © 2019 ely.assumpcao.ndiaye. All rights reserved.
//

import Foundation

// MARK: - UserAccount
struct UserAccount: Decodable {
    let userAccount: UserAccountDate
    // let error: Error
}

//// MARK: - Error
//struct Error: Decodable {
//}

// MARK: - UserAccountClass
struct UserAccountDate: Decodable {
    let userId: Int
    let name, bankAccount, agency: String
    let balance: Double
    
}
