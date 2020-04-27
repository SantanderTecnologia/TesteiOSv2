//
//  Float+Extension.swift
//  Bank
//
//  Created by Matheus Rodrigues Ribeiro on 26/04/20.
//  Copyright © 2020 Bank. All rights reserved.
//

import Foundation

extension Float {
    
    func toRealMoney() -> String {
        let formatter: NumberFormatter = {
           let formatter = NumberFormatter()
            formatter.locale = Locale(identifier: "pt_BR")
            formatter.numberStyle = .currency
            return formatter
        }()
        if let formattedAmount = formatter.string(from: self as NSNumber) {
            return formattedAmount
        }
        return ""
    }
    
}
