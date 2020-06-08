//
//  MoneyAttributedString.swift
//  UserInterface
//
//  Created by Estaife Lima on 07/06/20.
//  Copyright © 2020 Estaife Lima. All rights reserved.
//

import UIKit

extension NumberFormatter {
    
    static func formatForCurrency(_ value: Decimal) -> String? {
        let numberFormatter = NumberFormatter()
        numberFormatter.locale = Locale(identifier: "pt-BR")
        numberFormatter.numberStyle = .currency
        numberFormatter.currencyDecimalSeparator = ","
        numberFormatter.groupingSeparator = "."
        numberFormatter.currencySymbol = ""
        numberFormatter.maximumFractionDigits = 2
        numberFormatter.minimumFractionDigits = 2
        
        return numberFormatter.string(from: value as NSNumber)
    }
    
    static func balanceAttString(with balance: Decimal, and style: (symbolColor: UIColor, textColor: UIColor, fontSize: CGFloat)) -> NSMutableAttributedString? {
        guard let formattedBalance = NumberFormatter.formatForCurrency(balance) else { return nil }
        let negativeColor = NumberFormatter.negativeColor(balance: balance)
        let symbolFont = UIFont.systemFont(ofSize: style.fontSize, weight: .regular)
        let valueFont = UIFont.systemFont(ofSize: style.fontSize, weight: .regular)
        let currencySymbolAtt = NSAttributedString(string: "R$ ", attributes: [.font: symbolFont, .foregroundColor: negativeColor ?? style.symbolColor])
        let valueAtt = NSAttributedString(string: formattedBalance, attributes: [.font: valueFont, .foregroundColor: negativeColor ?? style.textColor])
        
        let balanceAttributedString = NSMutableAttributedString()
        balanceAttributedString.append(currencySymbolAtt)
        balanceAttributedString.append(valueAtt)
        
        return balanceAttributedString
    }
    
    private static func negativeColor(balance: Decimal) -> UIColor? {
        var negativeColor: UIColor? = nil
        if (balance as NSDecimalNumber).doubleValue < 0 {
            negativeColor = .systemRed
        }
        return negativeColor
    }
}

