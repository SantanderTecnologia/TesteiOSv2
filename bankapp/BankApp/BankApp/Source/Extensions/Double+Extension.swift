//
//  Double+Extension.swift
//  BankApp
//
//  Created by Pedro Danilo Ferreira Veloso on 21/05/19.
//  Copyright © 2019 pedrofveloso. All rights reserved.
//

import Foundation

extension Double {
    var toCurrency: String? {
        let nf = NumberFormatter()
        nf.locale = Locale(identifier: "pt_BR")
        nf.numberStyle = .currency
        let number = NSNumber(value: self)
        return nf.string(from: number)
    }
}
