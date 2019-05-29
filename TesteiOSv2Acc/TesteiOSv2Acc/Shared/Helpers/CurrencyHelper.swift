//
//  CurrencyHelper.swift
//  TesteiOSv2Acc
//
//  Created by Marlon Santos Heitor on 27/05/19.
//  Copyright © 2019 Marlon Santos Heitor. All rights reserved.
//

import Foundation

class CurrencyHelper {

    private init(){}
    
    static func convertToCurrency(value: Double, locale: Locale = Locale.init(identifier: "pt-BR")) -> String
    {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        currencyFormatter.locale = locale
        
        guard let formattedValue = currencyFormatter.string(from: NSNumber(value: value)) else
        {
            return ""
        }
        
        return formattedValue
    }
    
}
