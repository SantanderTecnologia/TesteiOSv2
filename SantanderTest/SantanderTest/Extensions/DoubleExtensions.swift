//
//  DoubleExtensions.swift
//  SantanderTest
//
//  Created by Maria Eugênia Pereira Teixeira on 25/07/20.
//  Copyright © 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import Foundation

extension Double {
    
    func convertToCurrency() -> String {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "pt_BR")
        formatter.numberStyle = .currency
        if let str = formatter.string(from: NSNumber(value: self)) {
            return str
        }
        return "\(self)"
    }
}
