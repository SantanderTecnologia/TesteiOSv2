//
//  Decimal+Extension.swift
//  Bank app
//
//  Created by mmalaqui on 20/05/2020.
//  Copyright © 2020 everis. All rights reserved.
//

import Foundation

extension Float {
    func formatCurrency() -> String?{
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        // localize to your grouping and decimal separator
        currencyFormatter.locale = Locale(identifier: "locale_identifier".localized)
        
        return currencyFormatter.string(from: NSNumber(value: self))
    }
}
