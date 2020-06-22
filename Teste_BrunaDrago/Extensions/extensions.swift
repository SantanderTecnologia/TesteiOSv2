//
//  extensions.swift
//  Teste_BrunaDrago
//
//  Created by Bruna Fernanda Drago on 21/06/20.
//  Copyright © 2020 Bruna Fernanda Drago. All rights reserved.
//

import Foundation

extension String {
    var dateFormat: String {
          let formatter = DateFormatter()
          formatter.locale = Locale(identifier: "pt_br")
          formatter.dateFormat = "dd/MM/YYYY"
          return formatter.string(from: Date())
      }
}

extension Double {
    var currencyFormat: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "pt_br")
        return formatter.string(from: NSNumber(value: self))!
    }
}
