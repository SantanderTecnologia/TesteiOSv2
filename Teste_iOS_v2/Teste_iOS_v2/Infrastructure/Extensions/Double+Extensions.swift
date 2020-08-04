//
//  Double+Extensions.swift
//  Teste_iOS_v2
//
//  Created by Lucas Fernandes Araujo on 04/08/20.
//  Copyright © 2020 Lucas Fernandes Araujo. All rights reserved.
//

import Foundation

extension Double {
    func getMoneyFormat() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.negativePrefix = String()
        formatter.currencySymbol = String()
        formatter.locale = Locale(identifier: "pt_BR")
        if let formattedValue = formatter.string(from: NSNumber(value: self)) {
            let symbol = self < 0 ? "- R$" : "R$"
            let value = symbol + formattedValue.trimmingCharacters(in: .whitespaces)
            return value
        }
       return String()
    }
}
