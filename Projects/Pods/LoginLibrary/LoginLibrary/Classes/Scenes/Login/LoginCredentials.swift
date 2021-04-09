//
//  structUser.swift
//  BankTesteiOSv2
//
//  Created by LeandroLee on 25/03/21.
//

import Foundation

public
class LoginCredentials
{
      public var emailOrCPF : String = ""
      public var password : String = ""
      
      convenience init( _ emailOrCPF: String, _ password: String )
      {
            self.init()
            
            self.emailOrCPF = emailOrCPF
            self.password = password
      }
}
