
import Foundation
import UIKit

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
}

