//
//  Help.swift
//  TrainamentoSantander
//
//  Created by matheus.p.souza on 12/07/19.
//  Copyright © 2019 matheus.p.souza. All rights reserved.
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
}

extension Locale {
    static let br = Locale(identifier: "pt_BR")
    static let us = Locale(identifier: "en_US")
    static let uk = Locale(identifier: "en_UK")
}
extension NumberFormatter {
    convenience init(style: Style, locale: Locale = .current) {
        self.init()
        self.locale = locale
        numberStyle = style
    }
}
extension Formatter {
    static let currency = NumberFormatter(style: .currency)
    static let currencyUS = NumberFormatter(style: .currency, locale: .us)
    static let currencyBR = NumberFormatter(style: .currency, locale: .br)
}
extension Numeric {   // for Swift 3 use FloatingPoint or Int
    var currency: String {
        return Formatter.currency.string(for: self) ?? ""
    }
    var currencyUS: String {
        return Formatter.currencyUS.string(for: self) ?? ""
    }
    var currencyBR: String {
        return Formatter.currencyBR.string(for: self) ?? ""
    }
}

