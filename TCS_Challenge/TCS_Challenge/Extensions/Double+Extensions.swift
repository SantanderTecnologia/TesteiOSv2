//
//  Double+Extensions.swift
//  TCS_Challenge
//
//  Created by Rafael Valer on 14/07/20.
//  Copyright © 2020 Rafael Valer. All rights reserved.
//

import Foundation

extension Double {
    
    /// Converts a double to currency style
    /// - Returns: currency style string
    func convertToCurrency() -> String? {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        currencyFormatter.maximumFractionDigits = 2
        currencyFormatter.minimumFractionDigits = 2
        currencyFormatter.numberStyle = .decimal
        currencyFormatter.groupingSize = 3
        currencyFormatter.decimalSeparator = ","
        currencyFormatter.groupingSeparator = "."

        let formatedValue = currencyFormatter.string(from: NSNumber(value: self))
        return formatedValue
    }
    
}
