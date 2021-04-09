//
//  UserRootStatement.swift
//  BankTesteiOSv2
//
//  Created by LeandroLee on 24/03/21.
//

import Foundation
import UIKit

public struct UserRootStatement: Codable
{
      public var statementList: [UserStatementList]
      public var error:  UserAccountError?
      
      enum CodingKeys: String, CodingKey
      {
            case statementList = "statementList"
            case error = "error"
      }
}
