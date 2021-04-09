//
//  classEmailOrCPFViewModel.swift
//  BankTesteiOSv2
//
//  Created by LeandroLee on 01/04/21.
//

import Foundation
import WorkersLibrary
import RxCocoa

public
class EmailOrCPFModel : ValidationModel
{      
      public var titleMessage: String  = TitleMessage.Attention.rawValue
      public var errorMessage: String = LoginError.EmailFail.rawValue
      
      public var data: BehaviorRelay<String> = BehaviorRelay(value: "")
      public var errorValue: BehaviorRelay<String?> = BehaviorRelay(value: "")
      
      public func validateData() -> Bool
      {
            let emailOrCPF = data.value

            if emailOrCPF.contains("@")
            {
                  guard Regex.isAcceptableEMail( emailOrCPF )
                  else
                  {
                        errorMessage = LoginError.EmailFail.rawValue
                        errorValue.accept( errorMessage )
                        
                        return false
                  }
                  
                  errorValue.accept(  "" )
                  
                  return true
            }
            else if( emailOrCPF.count == 11 )
            {
                  guard emailOrCPF.isRealCPF
                  else
                  {
                        errorMessage = LoginError.CPFFail.rawValue
                        errorValue.accept( errorMessage )
                        
                        return false
                  }
                  
                  errorValue.accept(  "" )
                  
                  return true
            }
            else
            {
                  errorValue.accept( errorMessage )
                  
                  return false
            }
      }
}
