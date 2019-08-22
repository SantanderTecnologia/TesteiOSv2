//
//  PriceFormatter.swift
//  CleanSwift
//
//  Created by Samanta Coutinho on 2019-08-19.
//  Copyright © 2019 Sam. All rights reserved.
//

import Foundation

struct PriceFormatter {
    static func formatPrice(price: Double) -> String {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        
        currencyFormatter.locale = Locale(identifier: "pt_BR")
        return currencyFormatter.string(from: NSNumber(value: price)) ?? ""
    }
}
