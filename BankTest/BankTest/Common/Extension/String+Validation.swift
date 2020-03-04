//
//  String+Extension.swift
//  BankTest
//
//  Created by Luan Nascimento Almeida on 02/03/20.
//  Copyright © 2020 bank. All rights reserved.
//

import Foundation

extension String {

    func isCPF() -> Bool {
        let digits = self.compactMap({ $0.wholeNumberValue })
        return digits.count == 11
    }

    func isValidEmail() -> Bool {
        let regex = "(?:[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}" +
            "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\" +
            "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[\\p{L}0-9](?:[a-" +
            "z0-9-]*[\\p{L}0-9])?\\.)+[\\p{L}0-9](?:[\\p{L}0-9-]*[\\p{L}0-9])?|\\[(?:(?:25[0-5" +
            "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-" +
            "9][0-9]?|[\\p{L}0-9-]*[\\p{L}0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21" +
        "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
        return NSPredicate(format:"SELF MATCHES %@", regex).evaluate(with: self)
    }

    func isValidCPF() -> Bool  {
        let numbers = compactMap({ Int(String($0)) })
        guard numbers.count == 11 && Set(numbers).count != 1 else { return false }
        func digitCalculator(_ slice: ArraySlice<Int>) -> Int {
            var number = slice.count + 2
            let digit = 11 - slice.reduce(into: 0) {
                number -= 1
                $0 += $1 * number
                } % 11
            return digit > 9 ? 0 : digit
        }
        let dv1 = digitCalculator(numbers.prefix(9))
        let dv2 = digitCalculator(numbers.prefix(10))
        return dv1 == numbers[9] && dv2 == numbers[10]
    }

    func isValidPassword() -> Bool {
        //Verifica se tem números
        let containsNumbers = self.compactMap({ $0.wholeNumberValue })
        if containsNumbers.isEmpty {
            return false
        }
        //Verifica se tem letra maiuscula
        let regex = "(?s)[^A-Z]*[A-Z].*"
        let containsUppercaseLetters = NSPredicate(format:"SELF MATCHES %@", regex).evaluate(with: self)
        if !containsUppercaseLetters {
            return false
        }
        //Verifica se tem caracter especial
        let characterset = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789")
        if self.rangeOfCharacter(from: characterset.inverted) == nil {
            return false
        }
        return true
    }
}
