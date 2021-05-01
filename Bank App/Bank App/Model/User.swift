//
//  User.swift
//  Bank App
//
//  Created by Christian Castro on 30/04/21.
//

import Foundation

class User: Codable {
    
    var name: String
    var userID: String
    var accountNumber: String
    var balance: String
    
    init(name: String,
         userID: String,
         accountNumber: String,
         balance: String) {
        self.name = name
        self.userID = userID
        self.accountNumber = accountNumber
        self.balance = balance
    }
}
