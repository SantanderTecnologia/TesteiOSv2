//
//  UserRootUserAccount.swift
//  BankTesteiOSv2
//
//  Created by LeandroLee on 24/03/21.
//

import Foundation
import UIKit

public struct UserRoot: Codable
{
      public var userAccount: UserAccount
      public var error:  UserAccountError?
      
      enum CodingKeys: String, CodingKey
      {
            case userAccount = "userAccount"
            case error = "error"
      }
}
