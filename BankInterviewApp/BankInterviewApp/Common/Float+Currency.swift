//
//  Float+Currency.swift
//  BankInterviewApp
//
//  Created by Osias Carneiro on 11/03/20.
//  Copyright © 2020 Osias Carneiro. All rights reserved.
//

import Foundation

extension Float {
    
    func formatToCoin(locale: Locale = Locale(identifier: "pt_BR")) -> String {
        let formatter: NumberFormatter = {
           let formatter = NumberFormatter()
            formatter.locale = locale
            formatter.numberStyle = .currency
            return formatter
        }()
        if let formattedAmount = formatter.string(from: self as NSNumber) {
            return formattedAmount
        }
        return ""
    }
    
}
