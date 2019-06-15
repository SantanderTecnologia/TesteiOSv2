//
//  String+NumericAndUpperCaseValidator.swift
//  TesteiOSv2
//
//  Created by Felipe Rodrigues Silva on 15/01/19.
//  Copyright © 2019 Felipe Rodrigues Silva. All rights reserved.
//

import Foundation

extension String{
    /**
     Check if string has a uppercase character.
     */
    func hasUpperCase() -> Bool {
        
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "(?=.*[A-Z]).{1,}")
        return passwordTest.evaluate(with: self)
    }
    
    func hasNumericCharacter() -> Bool {
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "(?=.*[0-9]).{1,}")
        return passwordTest.evaluate(with: self)
    }
}
