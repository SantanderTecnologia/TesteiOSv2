
import Foundation
import UIKit

extension Decimal {
    
    var toCurrency: String {
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
