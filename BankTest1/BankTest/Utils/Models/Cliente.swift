//
//  Cliente.swift
//  BankTest
//
//  Created by Jaber Vieira Da Silva Shamali on 05/04/21.
//

import Foundation

struct Cliente: Codable{
    var userAccount: ClienteDetalhes?
    
    enum CodingKeys: String, CodingKey {
        case userAccount = "userAccount"
    }
    
}

struct ClienteDetalhes: Codable {
    var userId: Int
    var name: String
    var bankAccount: String
    var agency: String
    var balance: Double
    
    enum CodingKeys: String, CodingKey {
        case userId = "userId"
        case name = "name"
        case bankAccount = "bankAccount"
        case agency = "agency"
        case balance = "balance"
    }
}

struct ClienteConvert: Codable {
    var userId: Int?
    var name: String?
    var account : String?
    var balance: String?

}

