//
//  Double+extensions.swift
//  TesteSantander
//
//  Created by Felipe Alexander Silva Melo on 30/05/19.
//  Copyright © 2019 Felipe Alexander Silva Melo. All rights reserved.
//

import Foundation

extension Double {
    func currencyFormat() -> String? {
        let formatter = NumberFormatter()
        formatter.locale = Locale.init(identifier: "PT_BR")
        formatter.numberStyle = .currency
        if let formattedTipAmount = formatter.string(from: self as NSNumber) {
            return "\(formattedTipAmount)"
        }
        
        return nil
    }
}
