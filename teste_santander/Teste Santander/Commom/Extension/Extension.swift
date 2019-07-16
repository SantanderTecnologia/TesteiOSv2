//
//  Extension.swift
//  Teste Santander
//
//  Created by THIAGO on 02/07/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import UIKit

protocol StoryboardInstanciate {
    var storyboardName: String { get }
    func viewControllerFromStoryboard(withIdentifier identifier: String) -> UIViewController
}

extension UITextField{
    @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: newValue!])
        }
    }
}

extension Formatter {
    static let currencyBYR: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.positiveFormat = "#,##0 ¤"
        formatter.negativeFormat = "-#,##0 ¤"
        formatter.currencySymbol = "Руб"
        return formatter
    }()
    static let currencyEUR: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "pt_PT")
        formatter.numberStyle = .currency
        return formatter
    }()
    static let currencyUSD: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "en_US")
        formatter.numberStyle = .currency
        return formatter
    }()
    static let currencyBRL: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "pt_BR")
        formatter.numberStyle = .currency
        formatter.negativePrefix = "R$ -"
        return formatter
    }()
    static let currencyRUB: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "ru_RU")
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 0
        return formatter
    }()
    static let currencyLocale: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.locale = .current
        formatter.numberStyle = .currency
        return formatter
    }()
}

extension Numeric {
    var currencyLocale: String { return Formatter.currencyLocale.string(for: self) ?? "" }
    var currencyUSD: String { return Formatter.currencyUSD.string(for: self) ?? "" }
    var currencyEUR: String { return Formatter.currencyEUR.string(for: self) ?? "" }
    var currencyBYR: String { return Formatter.currencyBYR.string(for: self) ?? "" }
    var currencyBRL: String { return Formatter.currencyBRL.string(for: self) ?? "" }
    var currencyRUB: String { return Formatter.currencyRUB.string(for: self) ?? "" }
}

protocol Identifier{}

extension Identifier where Self: NSObject{
    
    static var identifier: String { return String(describing: self) }
}

extension NSObject: Identifier {}

extension StoryboardInstanciate {
    
    var storyboard: UIStoryboard {
        return UIStoryboard(name: self.storyboardName, bundle: nil)
    }
    
    func viewControllerFromStoryboard(withIdentifier identifier: String) -> UIViewController {
        return storyboard.instantiateViewController(withIdentifier: identifier)
    }
}

extension CALayer {
    func applySketchShadow(
        color: UIColor = .black,
        alpha: Float = 0.5,
        x: CGFloat = 0,
        y: CGFloat = 2,
        blur: CGFloat = 4,
        spread: CGFloat = 0)
    {
        shadowColor = color.cgColor
        shadowOpacity = alpha
        shadowOffset = CGSize(width: x, height: y)
        shadowRadius = blur / 2.0
        if spread == 0 {
            shadowPath = nil
        } else {
            let dx = -spread
            let rect = bounds.insetBy(dx: dx, dy: dx)
            shadowPath = UIBezierPath(rect: rect).cgPath
        }
    }
}
