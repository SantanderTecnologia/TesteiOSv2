//
//  Double+Currency.swift
//  BankApp
//
//  Created by José Inácio Athayde Ferrarini on 18/03/20.
//  Copyright © 2020 br.com.solutis.inacioferrarini. All rights reserved.
//

import Foundation

extension Double {

    func asCurrency(for locale: Locale = Locale(identifier: "pt-BR")) -> String? {
        let formatter = NumberFormatter()
        formatter.locale = locale
        formatter.numberStyle = .currency

        if let finalValue = formatter.string(from: self as NSNumber) {
            return finalValue
        }
        return nil
    }

}
