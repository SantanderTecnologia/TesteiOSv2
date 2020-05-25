import Foundation
import UIKit

extension Int {
    
    func formatCurrency(showSign: Bool = false) -> String {
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 0
        formatter.locale = Locale(identifier: Locale.current.identifier)
        let result = formatter.string(from: self as NSNumber)
        
        if showSign {
            
            if self >= 0 {
                
                return "+".appending(result!)
            }
        }
        
        return result!
    }
}
