//
//  StringExtension.swift
//  TesteiOSv2
//
//  Created by Mônica Marques on 10/03/20.
//  Copyright © 2020 Mônica Marques. All rights reserved.
//

import Foundation

extension StringProtocol {
    var isValidCPF: Bool {
        let numbers = compactMap({ $0.wholeNumberValue })
        guard numbers.count == 11 && Set(numbers).count != 1 else { return false }
        func digitCalculator(_ slice: ArraySlice<Int>) -> Int {
            var number = slice.count + 2
            let digit = 11 - slice.reduce(into: 0) {
                number -= 1
                $0 += $1 * number
            } % 11
            return digit % 10
        }
        let dv1 = digitCalculator(numbers.prefix(9))
        let dv2 = digitCalculator(numbers.prefix(10))
        return dv1 == numbers[9] && dv2 == numbers[10]
    }
    
    var isValidEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
    
    var isValidPassword: Bool {
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "((?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[@#$%]).{6,20})")
        return passwordTest.evaluate(with: self)
    }
    
}

extension String {
    
    func toDate(withFormat format: String = "yyyy-MM-dd")-> Date?{

        let dateFormatter = DateFormatter()
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        dateFormatter.dateFormat = format
        let date = dateFormatter.date(from: self)

        return date
    }
    
    
}
