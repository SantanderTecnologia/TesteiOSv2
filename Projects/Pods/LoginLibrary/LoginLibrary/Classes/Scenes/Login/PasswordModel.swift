//
//  classPasswordViewModel.swift
//  BankTesteiOSv2
//
//  Created by LeandroLee on 01/04/21.
//

import Foundation
import RxCocoa
import WorkersLibrary

public
class PasswordModel : ValidationModel
{
      public var titleMessage: String  = TitleMessage.Attention.rawValue
      public var errorMessage: String = LoginError.PasswordFail.rawValue
      
      public var data: BehaviorRelay<String> = BehaviorRelay(value: "")
      public var errorValue: BehaviorRelay<String?> = BehaviorRelay(value: "")
      
      public func validateData() -> Bool
      {
            let password = data.value

            if Regex.isAcceptablePassword( password )
            {
                  errorValue.accept( "" )
                  
                  return true
            }
            else
            {
                  errorValue.accept( errorMessage )
                  
                  return false
            }
      }
}
