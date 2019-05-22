//
//  CurrencyDoubleExtension.swift
//  AppSantander
//
//  Created by Lucas Brandão Pereira on 20/04/19.
//  Copyright © 2019 Lucas Brandão Pereira. All rights reserved.
//

import Foundation

extension Double {
    func currency() -> String? {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "pt_BR")
        formatter.numberStyle = .currency
        if let formatted = formatter.string(from: NSNumber(value: self)) {
            return formatted
        }
        return nil
    }
}
