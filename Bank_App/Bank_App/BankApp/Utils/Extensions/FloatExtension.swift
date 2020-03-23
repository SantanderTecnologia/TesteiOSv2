//
//  FloatExtension.swift
//  Bank_App
//
//  Created by apple on 22/03/20.
//  Copyright © 2020 Barbara_Aniele. All rights reserved.
//

import Foundation

extension Float {
  
  func formatCurrency(valor: NSNumber) -> String? {
    let nf = NumberFormatter()
    nf.minimumFractionDigits = 2
    nf.maximumFractionDigits = 2
    nf.locale = Locale(identifier: "pt_BR")
    nf.currencySymbol = "R$"
    nf.numberStyle = .currency
    return nf.string(from: valor)
  }
  
}
