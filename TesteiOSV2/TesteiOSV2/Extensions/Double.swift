//
//  Double.swift
//  TesteiOSV2
//
//  Created by Julio Cezar de Souza on 06/06/20.
//  Copyright © 2020 Julio Souza. All rights reserved.
//

import UIKit

extension Double {
    
    func formatCurrency() -> String{
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "pt_BR")
        formatter.numberStyle = .currency
        if let formattedNumber = formatter.string(from: self as NSNumber) {
            return formattedNumber
        } else {
            return ""
        }
    }
}
