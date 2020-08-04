//
//  String+Extension.swift
//  Teste_iOS_v2
//
//  Created by Lucas Fernandes Araujo on 01/08/20.
//  Copyright © 2020 Lucas Fernandes Araujo. All rights reserved.
//

import Foundation

extension String {
    
    init(key: String, table: StringTables) {
        let str = Bundle.main.localizedString(forKey: key, value: nil, table: table.rawValue)
        self.init(str)
    }
    
    func convertToSnakeCase() -> String {
        let upperCasedLetters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        var result = String()
        var modifiedArray = [String.Element]()
        self.forEach { upperCasedLetters.contains($0) ? modifiedArray.append(contentsOf: ["#", $0]) : modifiedArray.append($0) }
        let words = String(modifiedArray).split(separator: "#")
        words.forEach { result.append("\($0.lowercased())_") }
        if !result.isEmpty { result.removeLast() }
        return result
    }
    
    func isValidCPF() -> Bool {
        let cpfNumbers = compactMap { Int(String($0)) }
        guard cpfNumbers.count == 11 && Set(cpfNumbers).count != 1 else { return false }
        func digitCalculator(_ slice: ArraySlice<Int>) -> Int {
            var number = slice.count + 2
            let digit = 11 - slice.reduce(into: 0) {
                number -= 1
                $0 += $1 * number
                } % 11
            return digit > 9 ? 0 : digit
        }
        
        let firstDigitChecker = digitCalculator(cpfNumbers.prefix(9))
        let secondDigitChecker = digitCalculator(cpfNumbers.prefix(10))
        return firstDigitChecker == cpfNumbers[9] && secondDigitChecker == cpfNumbers[10]
    }
    
    func isValidEmail() -> Bool {
        return NSRegularExpression(Constants.RegexPatterns.email).matches(self)
    }
    
    func hasNumbers() -> Bool {
        return NSRegularExpression(Constants.RegexPatterns.numbers).matches(self)
    }
    
    func hasCapitalLetters() -> Bool {
        return NSRegularExpression(Constants.RegexPatterns.capitalLetters).matches(self)
    }
    
    func hasSpecialCharacters() -> Bool {
        return NSRegularExpression(Constants.RegexPatterns.specialCharacters).matches(self)
    }
    
    func getFullDate() -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        if let date = formatter.date(from: self) {
            return date
        }
        return nil
    }
    
    func getFormmatedAgency() -> String {
        let hasToAddFirstDot = self.count > 5 ? true : false
        
        var newString = String()
        for (index, char) in self.enumerated() {
            if index == 2 && hasToAddFirstDot {
                newString.append(".\(String(char))")
            } else if index == self.count - 1 {
                newString.append("-\(String(char))")
            } else {
                newString.append(char)
            }
        }
        return newString
    }
    
}
