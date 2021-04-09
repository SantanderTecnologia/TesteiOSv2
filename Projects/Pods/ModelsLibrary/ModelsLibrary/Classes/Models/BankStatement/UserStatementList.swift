//
//  UserStatementModel.swift
//  BankTesteiOSv2
//
//  Created by LeandroLee on 24/03/21.
//

import Foundation

public struct UserStatementList: Codable
{
      public let title: String
      public let desc: String
      public let date: String
      public let value: Double
      
      enum CodingKeys: String, CodingKey
      {
            case title = "title"
            case desc = "desc"
            case date = "date"
            case value = "value"
      }
}
