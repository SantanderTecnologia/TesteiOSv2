//
//  Double+Extensions.swift
//  BankApp-Desafio
//
//  Created by Mizia Lima on 2/28/21.
//

import Foundation

extension Double {
    func toCurrencyFormat() -> String {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "pt_BR")
        formatter.numberStyle = .currency
        guard let formatedValue = formatter.string(from: self as NSNumber) else {
            return ""
        }
        return formatedValue
    }
}
