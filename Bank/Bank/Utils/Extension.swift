//
//  Extension.swift
//  Bank
//
//  Created by Junior Obici on 13/01/20.
//  Copyright © 2020 Junior Obici. All rights reserved.
//

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

extension String {
    var toShortDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        if let date = dateFormatter.date(from: self) {
            dateFormatter.locale = Locale(identifier: "pt_BR")
            dateFormatter.dateStyle = .short
            return dateFormatter.string(from: date)
        } else {
            return "error"
        }
    }
    
    func toAgency() -> String {
        var formattedAccount = self
        if formattedAccount.count > 3 {
            var characters = Array(self)
            characters.insert(".", at: 2)
            characters.insert("-", at: self.count)
            formattedAccount = String(characters)
        }
        return formattedAccount
    }

    func isNumber() -> Bool {
        let numberCharacters = NSCharacterSet.decimalDigits.inverted
        return !self.isEmpty && self.rangeOfCharacter(from: numberCharacters) == nil
    }
}

extension UIButton {
    @IBInspectable
    var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
}
