import Foundation
import UIKit

extension Double {
    
    public func formatCurrency(showSign: Bool = false, currencySymbol: String? = nil, numberOfDecimales: Int = 0) -> String {
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = numberOfDecimales
        
        if let currencySymbol = currencySymbol {
            
            formatter.currencySymbol = currencySymbol
            formatter.numberStyle = .currency
        }
        
        formatter.locale = Locale(identifier: Locale.current.identifier)
        let result = formatter.string(from: self as NSNumber)
        
        if showSign {
            
            if self >= 0 {
                
                return "+".appending(result!)
            }
        }
        
        return result!
    }
    
    public func round(numberOfDecimales: Int) -> String {
        
        return self.formatCurrency(showSign: false, currencySymbol: nil, numberOfDecimales: numberOfDecimales)
        
    }
}
