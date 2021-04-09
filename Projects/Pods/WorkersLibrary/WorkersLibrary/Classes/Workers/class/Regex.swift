//
//  classRegex.swift
//  BankTesteiOSv2
//
//  Created by LeandroLee on 24/03/21.
//

import Foundation

public class Regex
{

      public static func isAcceptableEMail(_ emailCandidate: String) -> Bool
      {
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            
            let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            
            return emailTest.evaluate(with: emailCandidate)
      }
    
      public static func isAcceptablePassword(_ passwordCandidate: String) -> Bool
      {
            let passwordRegEx = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{4,12}"
            
            let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
            
            return passwordTest.evaluate(with: passwordCandidate)
      }
    
}
