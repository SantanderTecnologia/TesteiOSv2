//
//  String+Extensions.swift
//  TCS_Challenge
//
//  Created by Rafael Valer on 14/07/20.
//  Copyright © 2020 Rafael Valer. All rights reserved.
//

import Foundation

extension String {
    
    func isValidEmail() -> Bool {
        let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
        return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
    }
    
    func isValidCPF() -> Bool {
        let numbers = compactMap(\.wholeNumberValue)
        guard numbers.count == 11 else { return false }
        
        return numbers.prefix(9).cpfDigit == numbers[9]
            && numbers.prefix(10).cpfDigit == numbers[10]
    }
    
    func containsUpperCaseLetter() -> Bool {
        return self.contains { (c) -> Bool in
            c >= "A" && c <= "Z"
        }
    }
    
    func containsNumber() -> Bool {
        return self.contains { (c) -> Bool in
            c >= "0" && c <= "9"
        }
    }
    
    func containsSpecialCharacter() -> Bool {
        return self.range(of: ".*[^A-Za-z0-9].*", options: .regularExpression) != nil
    }
    
    
    /// Converts a date string to another format
    /// - Parameters:
    ///   - from: String date format
    ///   - to: String date format
    /// - Returns: The final string converted to another date format
    func convert(fromDateFormat from: String, toDateFormat to: String) -> String? {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = from
        guard let fromDate = dateFormatter.date(from: self) else { return nil }

        dateFormatter.dateFormat = to
        let toDateString = dateFormatter.string(from: fromDate)
        return toDateString
    }
}
