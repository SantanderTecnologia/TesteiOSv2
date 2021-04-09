//
//  loginModel.swift
//  BankTesteiOSv2
//
//  Created by LeandroLee on 24/03/21.
//

import Foundation

public struct UserAccount: Codable
{
      public let userId: Int
      public let name: String
      public let bankAccount: String
      public let agency: String
      public let balance: Double
      
      enum CodingKeys: String, CodingKey
      {
            case userId = "userId"
            case name = "name"
            case bankAccount = "bankAccount"
            case agency = "agency"
            case balance = "balance"
      }
}
