//
//  UserAccountErrorModel.swift
//  BankTesteiOSv2
//
//  Created by LeandroLee on 24/03/21.
//

import Foundation

public struct UserAccountError: Codable
{
      public let code: Int?
      public let message: String?
      
      enum CodingKeys: String, CodingKey
      {
            case code = "code"
            case message = "message"
      }
}
