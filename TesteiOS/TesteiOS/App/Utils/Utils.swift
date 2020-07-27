//
//  Utils.swift
//  TesteIOS
//
//  Created by VM on 26/07/20.
//  Copyright © 2020 VM. All rights reserved.
//

import Foundation
import UIKit

extension String {
    func isValidRegex(regex: String) -> Bool {
        let predicate = NSPredicate(format:"SELF MATCHES %@", regex)
        return predicate.evaluate(with: self)
    }
    
    func isValidCpf() -> Bool {
        let numbers = compactMap({ Int(String($0))})
        guard numbers.count == 11 && Set(numbers).count != 1 else { return false }

        let dv1 = digitCalculator(slice: numbers.prefix(9))
        let dv2 = digitCalculator(slice: numbers.prefix(10))
        return dv1 == numbers[9] && dv2 == numbers[10]
    }
    
    private func digitCalculator(slice: ArraySlice<Int>) -> Int {
        var value = slice.count + 2
        
        let digit = 11 - slice.reduce(into: 0, { (result, number) in
            value -= 1
            result += number * value
        }) % 11

        return digit > 9 ? 0 : digit
    }
    
    func convertDataFormat() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: self)
        return date?.toString()
    }
    
    func toDate() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.date(from: self) ?? Date()
    }
}

extension Date {
func toString() -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd/MM/yyyy"
    return dateFormatter.string(from: self)
    }
}

extension Double {
    func currencyFormatted() -> String? {
        var number: NSNumber!
        let formatter = NumberFormatter()
        
        formatter.numberStyle = .currency
        formatter.locale = NSLocale(localeIdentifier: "pt_BR") as Locale
        
        number = NSNumber(value: self)
        
        return formatter.string(from: number)
    }
}
