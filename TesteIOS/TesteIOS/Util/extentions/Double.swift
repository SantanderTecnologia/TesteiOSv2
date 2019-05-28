//
//  File.swift
//  TesteIOS
//
//  Created by khalid ait bellahs on 23/01/19.
//  Copyright © 2019 ti alto nivel. All rights reserved.
//

import Foundation

extension Double {
    func toCurrency() -> String? {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "pt_BR")
        formatter.numberStyle = .currency
        return formatter.string(from: self as NSNumber)
    }
}
