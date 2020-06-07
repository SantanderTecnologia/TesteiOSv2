//
//  String.swift
//  TesteiOSV2
//
//  Created by Julio Cezar de Souza on 06/06/20.
//  Copyright © 2020 Julio Souza. All rights reserved.
//

import UIKit

extension String {
    
    func isEmailValid() -> Bool {
        let emailRegEx = "(?:[a-zA-Z0-9!#$%\\&‘*+/=?\\^_`{|}~-]+(?:\\.[a-zA-Z0-9!#$%\\&'*+/=?\\^_`{|}" +
            "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\" +
            "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-" +
            "z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5" +
            "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-" +
            "9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21" +
        "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
        
        let emailTest = NSPredicate(format: "SELF MATCHES[c] %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    func isPasswordStrengthHigh() -> Bool {
        let capitalLetterRegEx  = ".*[A-Z]+.*"
        let textTest = NSPredicate(format: "SELF MATCHES %@", capitalLetterRegEx)
        let capitalResult = textTest.evaluate(with: self)
        
        let numberRegEx  = ".*[0-9]+.*"
        let textTest1 = NSPredicate(format: "SELF MATCHES %@", numberRegEx)
        let numberResult = textTest1.evaluate(with: self)
        
        let specialCharacterRegEx  = ".*[!&^%$#@()/]+.*"
        let textTest2 = NSPredicate(format: "SELF MATCHES %@", specialCharacterRegEx)
        let specialresult = textTest2.evaluate(with: self)
        
        if capitalResult && numberResult && specialresult {
            return true
        } else {
            return false
        }
    }
    
        func toDate(format: String = "yyyy-MM-dd") -> Date? {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = format
    //        dateFormatter.locale = Locale(identifier: "pt_BR")
            guard let date = dateFormatter.date(from: self) else { return nil }
            return date
        }
}

extension StringProtocol {
    var isValidCPF: Bool {
        let numbers = compactMap({ Int(String($0)) })
        guard numbers.count == 11 && Set(numbers).count != 1 else { return false }
        let soma1 = 11 - ( numbers[0] * 10 +
            numbers[1] * 9 +
            numbers[2] * 8 +
            numbers[3] * 7 +
            numbers[4] * 6 +
            numbers[5] * 5 +
            numbers[6] * 4 +
            numbers[7] * 3 +
            numbers[8] * 2 ) % 11
        let dv1 = soma1 > 9 ? 0 : soma1
        let soma2 = 11 - ( numbers[0] * 11 +
            numbers[1] * 10 +
            numbers[2] * 9 +
            numbers[3] * 8 +
            numbers[4] * 7 +
            numbers[5] * 6 +
            numbers[6] * 5 +
            numbers[7] * 4 +
            numbers[8] * 3 +
            numbers[9] * 2 ) % 11
        let dv2 = soma2 > 9 ? 0 : soma2
        return dv1 == numbers[9] && dv2 == numbers[10]
    }
}

