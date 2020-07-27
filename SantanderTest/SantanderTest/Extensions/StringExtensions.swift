//
//  StringExtensions.swift
//  SantanderTest
//
//  Created by Maria Eugênia Pereira Teixeira on 25/07/20.
//  Copyright © 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import Foundation


extension String {
    
    var isValidPassword: Bool {
        let regex = "(?=.*?\\d)(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[^\\w]).{3,}"
        let pred = NSPredicate(format:"SELF MATCHES %@", regex)
        return pred.evaluate(with: self)
    }
    
    func formatDate() -> String {
        let dateFormatterReceived = DateFormatter()
        dateFormatterReceived.dateFormat = "yyyy-MM-dd"
        if let date = dateFormatterReceived.date(from: self) {
            let dateFormatterDesired = DateFormatter()
            dateFormatterDesired.dateFormat = "dd/MM/yyyy"
            let str = dateFormatterDesired.string(from: date)
            return str
        }
         return self
       
    }
}
