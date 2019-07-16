//
//  Currency.swift
//  TestSantander
//
//  Created by ely.assumpcao.ndiaye on 11/07/19.
//  Copyright © 2019 ely.assumpcao.ndiaye. All rights reserved.
//

import Foundation
import UIKit

extension Decimal {
    
    var Currency: String {
        let numberFormater = NumberFormatter()
        numberFormater.numberStyle = .currency
        numberFormater.locale = Locale(identifier: "pt_BR")
        if let priceFormatter = numberFormater.string(from: self as NSNumber) {
            return priceFormatter
        } else {
            return "error"
        }
    }
}
